/// Configuration for AppFlowy SDK
class AppFlowyConfig {
  /// Base URL for AppFlowy Cloud API
  final String baseUrl;

  /// Request timeout duration
  final Duration timeout;

  /// Enable debug logging
  final bool enableLogging;

  /// Custom token storage implementation
  final TokenStorage? tokenStorage;

  const AppFlowyConfig({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    this.enableLogging = false,
    this.tokenStorage,
  });

  /// Configuration for official AppFlowy Cloud
  factory AppFlowyConfig.cloud() {
    return const AppFlowyConfig(
      baseUrl: 'https://api.appflowy.io',
    );
  }

  /// Configuration for self-hosted AppFlowy instance
  factory AppFlowyConfig.selfHosted(String url) {
    return AppFlowyConfig(
      baseUrl: url,
    );
  }

  /// Configuration for local development/testing
  factory AppFlowyConfig.local({int port = 8000}) {
    return AppFlowyConfig(
      baseUrl: 'http://localhost:$port',
      enableLogging: true,
    );
  }

  /// Configuration for testing
  factory AppFlowyConfig.test() {
    return const AppFlowyConfig(
      baseUrl: 'http://localhost:8000',
      timeout: Duration(seconds: 10),
      enableLogging: true,
    );
  }

  AppFlowyConfig copyWith({
    String? baseUrl,
    Duration? timeout,
    bool? enableLogging,
    TokenStorage? tokenStorage,
  }) {
    return AppFlowyConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      timeout: timeout ?? this.timeout,
      enableLogging: enableLogging ?? this.enableLogging,
      tokenStorage: tokenStorage ?? this.tokenStorage,
    );
  }
}

/// Abstract interface for token storage
abstract class TokenStorage {
  /// Save access token
  Future<void> saveToken(String token);

  /// Get stored access token
  Future<String?> getToken();

  /// Save refresh token
  Future<void> saveRefreshToken(String token);

  /// Get stored refresh token
  Future<String?> getRefreshToken();

  /// Clear all tokens
  Future<void> clearTokens();
}

/// In-memory token storage (for testing)
class InMemoryTokenStorage implements TokenStorage {
  String? _accessToken;
  String? _refreshToken;

  @override
  Future<void> saveToken(String token) async {
    _accessToken = token;
  }

  @override
  Future<String?> getToken() async {
    return _accessToken;
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    _refreshToken = token;
  }

  @override
  Future<String?> getRefreshToken() async {
    return _refreshToken;
  }

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
  }
}
