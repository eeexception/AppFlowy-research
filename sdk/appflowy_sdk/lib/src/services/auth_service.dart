import '../core/client.dart';
import '../core/config.dart';
import '../core/exceptions.dart';
import '../models/user.dart';

/// Authentication service
class AuthService {
  final AppFlowyClient _client;
  final TokenStorage? _tokenStorage;

  UserProfile? _currentUser;
  String? _accessToken;
  String? _refreshToken;

  AuthService({
    required AppFlowyClient client,
    TokenStorage? tokenStorage,
  })  : _client = client,
        _tokenStorage = tokenStorage;

  /// Check if user is authenticated
  bool get isAuthenticated => _accessToken != null && _currentUser != null;

  /// Get current user
  UserProfile? get currentUser => _currentUser;

  /// Sign in with email and password
  Future<UserProfile> signInWithPassword({
    required String email,
    required String password,
  }) async {
    // Validate inputs
    if (email.isEmpty) {
      throw ValidationException('Email cannot be empty');
    }
    if (password.isEmpty) {
      throw ValidationException('Password cannot be empty');
    }

    final response = await _client.post(
      '/gotrue/token?grant_type=password',
      data: {
        'email': email,
        'password': password,
      },
    );

    // Parse response
    final authResponse = AuthResponse.fromJson(response);

    // Store tokens
    await _storeTokens(
      authResponse.accessToken,
      authResponse.refreshToken,
    );

    // Set auth token in client
    _client.setAuthToken(authResponse.accessToken);

    // Store user
    _currentUser = authResponse.user;

    return authResponse.user;
  }

  /// Sign in as guest
  Future<UserProfile> signInAsGuest() async {
    final response = await _client.post('/gotrue/signup', data: {
      'email': 'guest_${DateTime.now().millisecondsSinceEpoch}@appflowy.io',
      'password': 'guest_password_${DateTime.now().millisecondsSinceEpoch}',
    });

    // Parse response
    final authResponse = AuthResponse.fromJson(response);

    // Store tokens
    await _storeTokens(
      authResponse.accessToken,
      authResponse.refreshToken,
    );

    // Set auth token in client
    _client.setAuthToken(authResponse.accessToken);

    // Store user
    _currentUser = authResponse.user;

    return authResponse.user;
  }

  /// Get current user profile
  Future<UserProfile> getCurrentUser() async {
    if (!isAuthenticated) {
      throw AuthenticationException('Not authenticated');
    }

    final response = await _client.get('/gotrue/user');

    final user = UserProfile.fromJson(response);
    _currentUser = user;

    return user;
  }

  /// Update user profile
  Future<void> updateProfile({
    String? name,
    String? avatarUrl,
  }) async {
    if (!isAuthenticated) {
      throw AuthenticationException('Not authenticated');
    }

    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (avatarUrl != null) data['avatar_url'] = avatarUrl;

    await _client.post('/api/user/update', data: data);

    // Refresh user profile
    await getCurrentUser();
  }

  /// Refresh authentication token
  Future<void> refreshToken() async {
    if (_refreshToken == null) {
      throw AuthenticationException('No refresh token available');
    }

    final response = await _client.post(
      '/api/user/refresh',
      data: {
        'refresh_token': _refreshToken,
      },
    );

    final tokenResponse = TokenResponse.fromJson(response);

    // Store new tokens
    await _storeTokens(
      tokenResponse.accessToken,
      tokenResponse.refreshToken,
    );

    // Update client auth token
    _client.setAuthToken(tokenResponse.accessToken);
  }

  /// Sign out
  Future<void> signOut() async {
    // Clear tokens
    _accessToken = null;
    _refreshToken = null;
    _currentUser = null;

    // Clear tokens from storage
    await _tokenStorage?.clearTokens();

    // Clear auth token from client
    _client.clearAuthToken();
  }

  /// Delete account
  Future<void> deleteAccount() async {
    if (!isAuthenticated) {
      throw AuthenticationException('Not authenticated');
    }

    await _client.delete('/api/user');

    // Clear tokens after deletion
    await signOut();
  }

  /// Store tokens in memory and persistent storage
  Future<void> _storeTokens(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;

    // Store in persistent storage if available
    await _tokenStorage?.saveToken(accessToken);
    await _tokenStorage?.saveRefreshToken(refreshToken);
  }

  /// Restore session from stored tokens
  Future<void> restoreSession() async {
    if (_tokenStorage == null) return;

    final accessToken = await _tokenStorage!.getToken();
    final refreshToken = await _tokenStorage!.getRefreshToken();

    if (accessToken != null && refreshToken != null) {
      _accessToken = accessToken;
      _refreshToken = refreshToken;
      _client.setAuthToken(accessToken);

      // Try to get user profile
      try {
        await getCurrentUser();
      } catch (e) {
        // Token might be expired, try to refresh
        try {
          await this.refreshToken();
          await getCurrentUser();
        } catch (e) {
          // Refresh failed, clear session
          await signOut();
        }
      }
    }
  }
}
