import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

// Import the classes we'll be testing (not yet implemented)
// import 'package:appflowy_sdk/src/services/auth_service.dart';
// import 'package:appflowy_sdk/src/core/client.dart';
// import 'package:appflowy_sdk/src/models/user.dart';
// import 'package:appflowy_sdk/src/core/exceptions.dart';

void main() {
  group('AuthService', () {
    // late AuthService authService;
    // late MockAppFlowyClient mockClient;

    setUp(() {
      // mockClient = MockAppFlowyClient();
      // authService = AuthService(client: mockClient);
    });

    group('signInWithPassword', () {
      test('should return UserProfile on successful login', () async {
        // final mockResponse = {
        //   'id': 'user-123',
        //   'email': 'test@example.com',
        //   'name': 'Test User',
        //   'created_at': '2024-01-01T00:00:00Z',
        // };
        //
        // when(mockClient.post('/api/user/sign_in', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // final user = await authService.signInWithPassword(
        //   email: 'test@example.com',
        //   password: 'password123',
        // );
        //
        // expect(user.id, equals('user-123'));
        // expect(user.email, equals('test@example.com'));
        // expect(user.name, equals('Test User'));
      });

      test('should store auth token after successful login', () async {
        // final mockResponse = {
        //   'user': {
        //     'id': 'user-123',
        //     'email': 'test@example.com',
        //     'name': 'Test User',
        //   },
        //   'access_token': 'token-abc',
        //   'refresh_token': 'refresh-xyz',
        // };
        //
        // when(mockClient.post('/api/user/sign_in', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // await authService.signInWithPassword(
        //   email: 'test@example.com',
        //   password: 'password123',
        // );
        //
        // verify(mockClient.setAuthToken('token-abc')).called(1);
      });

      test('should throw AuthenticationException on invalid credentials', () async {
        // when(mockClient.post('/api/user/sign_in', data: anyNamed('data')))
        //     .thenThrow(AuthenticationException('Invalid credentials'));
        //
        // expect(
        //   () => authService.signInWithPassword(
        //     email: 'test@example.com',
        //     password: 'wrong-password',
        //   ),
        //   throwsA(isA<AuthenticationException>()),
        // );
      });

      test('should throw ValidationException on empty email', () async {
        // expect(
        //   () => authService.signInWithPassword(
        //     email: '',
        //     password: 'password123',
        //   ),
        //   throwsA(isA<ValidationException>()),
        // );
      });

      test('should throw ValidationException on empty password', () async {
        // expect(
        //   () => authService.signInWithPassword(
        //     email: 'test@example.com',
        //     password: '',
        //   ),
        //   throwsA(isA<ValidationException>()),
        // );
      });
    });

    group('signInAsGuest', () {
      test('should return UserProfile for guest user', () async {
        // final mockResponse = {
        //   'id': 'guest-123',
        //   'email': 'guest@appflowy.io',
        //   'name': 'Guest User',
        //   'is_guest': true,
        // };
        //
        // when(mockClient.post('/api/user/guest', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // final user = await authService.signInAsGuest();
        //
        // expect(user.id, equals('guest-123'));
        // expect(user.email, contains('guest'));
      });

      test('should store auth token for guest user', () async {
        // final mockResponse = {
        //   'user': {
        //     'id': 'guest-123',
        //     'email': 'guest@appflowy.io',
        //   },
        //   'access_token': 'guest-token',
        // };
        //
        // when(mockClient.post('/api/user/guest', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // await authService.signInAsGuest();
        //
        // verify(mockClient.setAuthToken('guest-token')).called(1);
      });
    });

    group('getCurrentUser', () {
      test('should return current user profile', () async {
        // final mockResponse = {
        //   'id': 'user-123',
        //   'email': 'test@example.com',
        //   'name': 'Test User',
        // };
        //
        // when(mockClient.get('/api/user/profile'))
        //     .thenAnswer((_) async => mockResponse);
        //
        // final user = await authService.getCurrentUser();
        //
        // expect(user.id, equals('user-123'));
        // expect(user.email, equals('test@example.com'));
      });

      test('should throw AuthenticationException when not logged in', () async {
        // when(mockClient.get('/api/user/profile'))
        //     .thenThrow(AuthenticationException('Not authenticated'));
        //
        // expect(
        //   () => authService.getCurrentUser(),
        //   throwsA(isA<AuthenticationException>()),
        // );
      });
    });

    group('updateProfile', () {
      test('should update user profile', () async {
        // when(mockClient.post('/api/user/update', data: anyNamed('data')))
        //     .thenAnswer((_) async => {'success': true});
        //
        // await authService.updateProfile(
        //   name: 'Updated Name',
        //   avatarUrl: 'https://example.com/avatar.jpg',
        // );
        //
        // verify(mockClient.post(
        //   '/api/user/update',
        //   data: {
        //     'name': 'Updated Name',
        //     'avatar_url': 'https://example.com/avatar.jpg',
        //   },
        // )).called(1);
      });
    });

    group('signOut', () {
      test('should clear auth token', () async {
        // await authService.signOut();
        //
        // verify(mockClient.clearAuthToken()).called(1);
      });

      test('should clear cached user data', () async {
        // // First sign in
        // final mockResponse = {
        //   'user': {'id': 'user-123'},
        //   'access_token': 'token',
        // };
        //
        // when(mockClient.post('/api/user/sign_in', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // await authService.signInWithPassword(
        //   email: 'test@example.com',
        //   password: 'password',
        // );
        //
        // expect(authService.currentUser, isNotNull);
        //
        // // Then sign out
        // await authService.signOut();
        //
        // expect(authService.currentUser, isNull);
      });
    });

    group('refreshToken', () {
      test('should refresh access token using refresh token', () async {
        // final mockResponse = {
        //   'access_token': 'new-token',
        //   'refresh_token': 'new-refresh-token',
        // };
        //
        // when(mockClient.post('/api/user/refresh', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // await authService.refreshToken();
        //
        // verify(mockClient.setAuthToken('new-token')).called(1);
      });

      test('should throw AuthenticationException if refresh fails', () async {
        // when(mockClient.post('/api/user/refresh', data: anyNamed('data')))
        //     .thenThrow(AuthenticationException('Refresh token expired'));
        //
        // expect(
        //   () => authService.refreshToken(),
        //   throwsA(isA<AuthenticationException>()),
        // );
      });
    });

    group('deleteAccount', () {
      test('should delete user account', () async {
        // when(mockClient.delete('/api/user'))
        //     .thenAnswer((_) async => null);
        //
        // await authService.deleteAccount();
        //
        // verify(mockClient.delete('/api/user')).called(1);
      });

      test('should clear auth token after deletion', () async {
        // when(mockClient.delete('/api/user'))
        //     .thenAnswer((_) async => null);
        //
        // await authService.deleteAccount();
        //
        // verify(mockClient.clearAuthToken()).called(1);
      });
    });

    group('isAuthenticated', () {
      test('should return true when user is logged in', () async {
        // final mockResponse = {
        //   'user': {'id': 'user-123'},
        //   'access_token': 'token',
        // };
        //
        // when(mockClient.post('/api/user/sign_in', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // await authService.signInWithPassword(
        //   email: 'test@example.com',
        //   password: 'password',
        // );
        //
        // expect(authService.isAuthenticated, isTrue);
      });

      test('should return false when user is not logged in', () {
        // expect(authService.isAuthenticated, isFalse);
      });

      test('should return false after sign out', () async {
        // // Sign in first
        // final mockResponse = {
        //   'user': {'id': 'user-123'},
        //   'access_token': 'token',
        // };
        //
        // when(mockClient.post('/api/user/sign_in', data: anyNamed('data')))
        //     .thenAnswer((_) async => mockResponse);
        //
        // await authService.signInWithPassword(
        //   email: 'test@example.com',
        //   password: 'password',
        // );
        //
        // expect(authService.isAuthenticated, isTrue);
        //
        // // Then sign out
        // await authService.signOut();
        //
        // expect(authService.isAuthenticated, isFalse);
      });
    });
  });
}
