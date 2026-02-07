import 'package:test/test.dart';
import 'package:appflowy_sdk/src/core/exceptions.dart';

void main() {
  group('AppFlowyException', () {
    test('AuthenticationException should have correct properties', () {
      final exception = AuthenticationException(
        'Invalid credentials',
        statusCode: 401,
        details: 'Email or password is incorrect',
      );

      expect(exception.message, equals('Invalid credentials'));
      expect(exception.statusCode, equals(401));
      expect(exception.details, equals('Email or password is incorrect'));
    });

    test('ValidationException should include field errors', () {
      final exception = ValidationException(
        'Validation failed',
        statusCode: 400,
        fieldErrors: {
          'email': ['Invalid email format'],
          'password': ['Password too short'],
        },
      );

      expect(exception.fieldErrors, isNotNull);
      expect(exception.fieldErrors!['email'], contains('Invalid email format'));
      expect(exception.fieldErrors!['password'], contains('Password too short'));
    });

    test('toString should include status code and details', () {
      final exception = NotFoundException(
        'Resource not found',
        statusCode: 404,
        details: 'The requested resource does not exist',
      );

      final string = exception.toString();
      expect(string, contains('NotFoundException'));
      expect(string, contains('Resource not found'));
      expect(string, contains('Status: 404'));
      expect(string, contains('Details:'));
    });
  });
}
