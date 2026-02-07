/// Configuration examples for different environments
///
/// This example shows:
/// - Using AppFlowy Cloud (hosted)
/// - Self-hosted instances
/// - Local development
/// - Custom token storage
/// - Timeout configuration

import 'package:appflowy_sdk/appflowy_sdk.dart';

void main() async {
  print('⚙️  AppFlowy SDK Configuration Examples\n');

  // Example 1: AppFlowy Cloud (Production)
  exampleCloudConfig();

  // Example 2: Self-Hosted Instance
  exampleSelfHostedConfig();

  // Example 3: Local Development
  exampleLocalConfig();

  // Example 4: Custom Configuration
  exampleCustomConfig();

  // Example 5: Custom Token Storage
  await exampleCustomTokenStorage();
}

/// Example 1: AppFlowy Cloud (Hosted Service)
void exampleCloudConfig() {
  print('☁️  Example 1: AppFlowy Cloud (Hosted)');
  print('=' * 50);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig.cloud(),
  );

  print('✅ SDK configured for: ${sdk.config.baseUrl}');
  print('   This uses the official AppFlowy Cloud service');
  print('   No infrastructure setup required!\n');
}

/// Example 2: Self-Hosted Instance
void exampleSelfHostedConfig() {
  print('🏢 Example 2: Self-Hosted Instance');
  print('=' * 50);

  // Your own AppFlowy Cloud instance
  final sdk = AppFlowySDK(
    config: AppFlowyConfig.selfHosted('https://appflowy.mycompany.com'),
  );

  print('✅ SDK configured for: ${sdk.config.baseUrl}');
  print('   Connect to your own AppFlowy Cloud deployment');
  print('   Full control over data and infrastructure\n');
}

/// Example 3: Local Development
void exampleLocalConfig() {
  print('💻 Example 3: Local Development');
  print('=' * 50);

  // Local Docker instance
  final sdk = AppFlowySDK(
    config: AppFlowyConfig.local(port: 80),
  );

  print('✅ SDK configured for: ${sdk.config.baseUrl}');
  print('   Perfect for development and testing');
  print('   Start with: docker-compose up -d\n');
}

/// Example 4: Custom Configuration
void exampleCustomConfig() {
  print('🔧 Example 4: Custom Configuration');
  print('=' * 50);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig(
      baseUrl: 'https://custom.appflowy.io',
      timeout: const Duration(seconds: 60), // Longer timeout
      enableLogging: true, // Enable debug logging
    ),
  );

  print('✅ Custom configuration:');
  print('   Base URL: ${sdk.config.baseUrl}');
  print('   Timeout: ${sdk.config.timeout.inSeconds}s');
  print('   Logging: ${sdk.config.enableLogging ? "Enabled" : "Disabled"}\n');
}

/// Example 5: Custom Token Storage
Future<void> exampleCustomTokenStorage() async {
  print('💾 Example 5: Custom Token Storage');
  print('=' * 50);

  // Use custom token storage (e.g., secure storage, encrypted storage)
  final tokenStorage = MyCustomTokenStorage();

  final sdk = AppFlowySDK(
    config: AppFlowyConfig(
      baseUrl: 'https://api.appflowy.io',
      tokenStorage: tokenStorage,
    ),
  );

  print('✅ SDK configured with custom token storage');
  print('   Tokens will be stored securely');
  print('   Persists across app restarts\n');

  // Tokens are automatically saved on sign-in
  // and restored on app restart
}

/// Custom Token Storage Implementation
///
/// In production, you might use:
/// - flutter_secure_storage for mobile apps
/// - shared_preferences for simple storage
/// - Your own encrypted storage solution
class MyCustomTokenStorage implements TokenStorage {
  // In-memory storage for demo (use real storage in production)
  String? _accessToken;
  String? _refreshToken;

  @override
  Future<void> saveToken(String token) async {
    _accessToken = token;
    print('   [Storage] Saved access token');
    // In production: await secureStorage.write(key: 'access_token', value: token);
  }

  @override
  Future<String?> getToken() async {
    print('   [Storage] Retrieved access token');
    return _accessToken;
    // In production: return await secureStorage.read(key: 'access_token');
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    _refreshToken = token;
    print('   [Storage] Saved refresh token');
  }

  @override
  Future<String?> getRefreshToken() async {
    print('   [Storage] Retrieved refresh token');
    return _refreshToken;
  }

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    print('   [Storage] Cleared all tokens');
  }
}

/// Environment-based Configuration
///
/// In production apps, you might want to switch configurations
/// based on environment variables or build flavors
class EnvironmentConfig {
  static AppFlowyConfig getConfig() {
    const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');

    switch (environment) {
      case 'production':
        return AppFlowyConfig.cloud();
      case 'staging':
        return AppFlowyConfig.selfHosted('https://staging.appflowy.io');
      case 'development':
      default:
        return AppFlowyConfig.local(port: 80);
    }
  }
}

/// Usage with environment-based config:
///
/// void main() {
///   final sdk = AppFlowySDK(
///     config: EnvironmentConfig.getConfig(),
///   );
/// }
///
/// Run with:
/// dart --define=ENVIRONMENT=production example/configuration_examples.dart
