/// Base exception for all AppFlowy SDK errors
abstract class AppFlowyException implements Exception {
  final String message;
  final int? statusCode;
  final String? details;

  AppFlowyException(
    this.message, {
    this.statusCode,
    this.details,
  });

  @override
  String toString() {
    final buffer = StringBuffer('$runtimeType: $message');
    if (statusCode != null) {
      buffer.write(' (Status: $statusCode)');
    }
    if (details != null) {
      buffer.write('\nDetails: $details');
    }
    return buffer.toString();
  }
}

/// Authentication failed (401)
class AuthenticationException extends AppFlowyException {
  AuthenticationException(
    super.message, {
    super.statusCode,
    super.details,
  });
}

/// Access denied / Insufficient permissions (403)
class AuthorizationException extends AppFlowyException {
  AuthorizationException(
    super.message, {
    super.statusCode,
    super.details,
  });
}

/// Resource not found (404)
class NotFoundException extends AppFlowyException {
  NotFoundException(
    super.message, {
    super.statusCode,
    super.details,
  });
}

/// Validation error (400)
class ValidationException extends AppFlowyException {
  final Map<String, List<String>>? fieldErrors;

  ValidationException(
    super.message, {
    super.statusCode,
    super.details,
    this.fieldErrors,
  });

  @override
  String toString() {
    final buffer = StringBuffer(super.toString());
    if (fieldErrors != null && fieldErrors!.isNotEmpty) {
      buffer.write('\nField Errors:');
      fieldErrors!.forEach((field, errors) {
        buffer.write('\n  $field: ${errors.join(', ')}');
      });
    }
    return buffer.toString();
  }
}

/// Network connectivity error
class NetworkException extends AppFlowyException {
  NetworkException(
    super.message, {
    super.statusCode,
    super.details,
  });
}

/// Server error (500+)
class ServerException extends AppFlowyException {
  ServerException(
    super.message, {
    super.statusCode,
    super.details,
  });
}

/// Rate limit exceeded (429)
class RateLimitException extends AppFlowyException {
  final Duration? retryAfter;

  RateLimitException(
    super.message, {
    super.statusCode,
    super.details,
    this.retryAfter,
  });

  @override
  String toString() {
    final buffer = StringBuffer(super.toString());
    if (retryAfter != null) {
      buffer.write('\nRetry after: ${retryAfter!.inSeconds} seconds');
    }
    return buffer.toString();
  }
}
