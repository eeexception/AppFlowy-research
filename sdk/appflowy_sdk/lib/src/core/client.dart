import 'package:dio/dio.dart';
import 'exceptions.dart';

/// HTTP client for AppFlowy Cloud API
class AppFlowyClient {
  final String baseUrl;
  final Duration timeout;
  final Dio _dio;
  String? authToken;

  AppFlowyClient({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    Dio? dio,
  }) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = timeout;
    _dio.options.receiveTimeout = timeout;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Add error interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          final exception = _handleError(error);
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: exception,
              response: error.response,
              type: error.type,
            ),
          );
        },
      ),
    );
  }

  /// Make GET request
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: params,
        options: _buildOptions(),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.error is AppFlowyException) {
        throw e.error as AppFlowyException;
      }
      throw _handleError(e);
    }
  }

  /// Make POST request
  Future<dynamic> post(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: _buildOptions(),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.error is AppFlowyException) {
        throw e.error as AppFlowyException;
      }
      throw _handleError(e);
    }
  }

  /// Make PUT request
  Future<dynamic> put(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        options: _buildOptions(),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.error is AppFlowyException) {
        throw e.error as AppFlowyException;
      }
      throw _handleError(e);
    }
  }

  /// Make DELETE request
  Future<dynamic> delete(String path) async {
    try {
      final response = await _dio.delete(
        path,
        options: _buildOptions(),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.error is AppFlowyException) {
        throw e.error as AppFlowyException;
      }
      throw _handleError(e);
    }
  }

  /// Make PATCH request
  Future<dynamic> patch(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        options: _buildOptions(),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.error is AppFlowyException) {
        throw e.error as AppFlowyException;
      }
      throw _handleError(e);
    }
  }

  /// Set authentication token
  void setAuthToken(String token) {
    authToken = token;
  }

  /// Clear authentication token
  void clearAuthToken() {
    authToken = null;
  }

  /// Build request options with auth token if available
  Options _buildOptions() {
    final headers = <String, dynamic>{};
    if (authToken != null) {
      headers['Authorization'] = 'Bearer $authToken';
    }
    return Options(headers: headers);
  }

  /// Handle Dio errors and convert to AppFlowy exceptions
  AppFlowyException _handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    // Handle network errors
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.connectionError) {
      return NetworkException(
        'Network error: ${error.message}',
        statusCode: statusCode,
      );
    }

    // Handle HTTP status code errors
    if (statusCode != null) {
      final message = _extractErrorMessage(data) ?? 'Request failed';

      switch (statusCode) {
        case 400:
          return ValidationException(
            message,
            statusCode: statusCode,
            fieldErrors: _extractFieldErrors(data),
          );

        case 401:
          return AuthenticationException(
            message,
            statusCode: statusCode,
          );

        case 403:
          return AuthorizationException(
            message,
            statusCode: statusCode,
          );

        case 404:
          return NotFoundException(
            message,
            statusCode: statusCode,
          );

        case 429:
          final retryAfter = _extractRetryAfter(error.response);
          return RateLimitException(
            message,
            statusCode: statusCode,
            retryAfter: retryAfter,
          );

        case >= 500:
          return ServerException(
            message,
            statusCode: statusCode,
          );

        default:
          return ServerException(
            message,
            statusCode: statusCode,
          );
      }
    }

    // Fallback for unknown errors
    return NetworkException(
      error.message ?? 'Unknown error occurred',
    );
  }

  /// Extract error message from response data
  String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ??
          data['error'] as String? ??
          data['detail'] as String?;
    }
    return null;
  }

  /// Extract field errors from validation error response
  Map<String, List<String>>? _extractFieldErrors(dynamic data) {
    if (data is Map<String, dynamic>) {
      final errors = data['errors'];
      if (errors is Map<String, dynamic>) {
        return errors.map((key, value) {
          if (value is List) {
            return MapEntry(key, value.cast<String>());
          }
          return MapEntry(key, [value.toString()]);
        });
      }
    }
    return null;
  }

  /// Extract retry-after duration from response headers
  Duration? _extractRetryAfter(Response? response) {
    final retryAfter = response?.headers.value('retry-after');
    if (retryAfter != null) {
      final seconds = int.tryParse(retryAfter);
      if (seconds != null) {
        return Duration(seconds: seconds);
      }
    }
    return null;
  }
}
