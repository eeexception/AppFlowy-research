import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:appflowy_sdk/src/core/client.dart';
import 'package:appflowy_sdk/src/core/exceptions.dart';

import 'client_test.mocks.dart';

// Generate nice mocks (automatically stubs properties)
@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('AppFlowyClient', () {
    late AppFlowyClient client;
    late MockDio mockDio;
    late BaseOptions mockOptions;

    setUp(() {
      mockDio = MockDio();
      mockOptions = BaseOptions();
      when(mockDio.options).thenReturn(mockOptions);
      when(mockDio.interceptors).thenReturn(Interceptors());

      client = AppFlowyClient(
        baseUrl: 'https://api.appflowy.io',
        dio: mockDio,
      );
    });

    group('Constructor', () {
      test('should create client with provided baseUrl', () {
        final client = AppFlowyClient(baseUrl: 'https://test.com');
        expect(client.baseUrl, equals('https://test.com'));
      });

      test('should create client with default timeout', () {
        final client = AppFlowyClient(baseUrl: 'https://test.com');
        expect(client.timeout, equals(Duration(seconds: 30)));
      });

      test('should create client with custom timeout', () {
        final client = AppFlowyClient(
          baseUrl: 'https://test.com',
          timeout: Duration(seconds: 60),
        );
        expect(client.timeout, equals(Duration(seconds: 60)));
      });
    });

    group('GET requests', () {
      test('should make GET request with correct URL', () async {
        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                  data: {'success': true},
                  statusCode: 200,
                  requestOptions: RequestOptions(path: ''),
                ));

        await client.get('/test');

        verify(mockDio.get(
          '/test',
          queryParameters: null,
          options: anyNamed('options'),
        )).called(1);
      });

      test('should include query parameters in GET request', () async {
        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                  data: {'success': true},
                  statusCode: 200,
                  requestOptions: RequestOptions(path: ''),
                ));

        await client.get('/test', params: {'key': 'value'});

        verify(mockDio.get(
          any,
          queryParameters: {'key': 'value'},
          options: anyNamed('options'),
        )).called(1);
      });

      test('should include auth token in headers if set', () async {
        client.setAuthToken('test-token');

        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                  data: {'success': true},
                  statusCode: 200,
                  requestOptions: RequestOptions(path: ''),
                ));

        await client.get('/test');

        verify(mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
          options: argThat(
            predicate<Options>((opts) =>
                opts.headers?['Authorization'] == 'Bearer test-token'),
            named: 'options',
          ),
        )).called(1);
      });
    });

    group('POST requests', () {
      test('should make POST request with data', () async {
        when(mockDio.post(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                  data: {'id': '123'},
                  statusCode: 201,
                  requestOptions: RequestOptions(path: ''),
                ));

        await client.post('/test', data: {'name': 'Test'});

        verify(mockDio.post(
          '/test',
          data: {'name': 'Test'},
          options: anyNamed('options'),
        )).called(1);
      });
    });

    group('PUT requests', () {
      test('should make PUT request with data', () async {
        when(mockDio.put(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                  data: {'success': true},
                  statusCode: 200,
                  requestOptions: RequestOptions(path: ''),
                ));

        await client.put('/test/123', data: {'name': 'Updated'});

        verify(mockDio.put(
          '/test/123',
          data: {'name': 'Updated'},
          options: anyNamed('options'),
        )).called(1);
      });
    });

    group('DELETE requests', () {
      test('should make DELETE request', () async {
        when(mockDio.delete(any, options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                  statusCode: 204,
                  requestOptions: RequestOptions(path: ''),
                ));

        await client.delete('/test/123');

        verify(mockDio.delete('/test/123', options: anyNamed('options')))
            .called(1);
      });
    });

    group('PATCH requests', () {
      test('should make PATCH request with data', () async {
        when(mockDio.patch(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                  data: {'success': true},
                  statusCode: 200,
                  requestOptions: RequestOptions(path: ''),
                ));

        await client.patch('/test/123', data: {'name': 'Patched'});

        verify(mockDio.patch(
          '/test/123',
          data: {'name': 'Patched'},
          options: anyNamed('options'),
        )).called(1);
      });
    });

    group('Error handling', () {
      test('should throw AuthenticationException on 401', () async {
        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenThrow(DioException(
          response: Response(
            statusCode: 401,
            requestOptions: RequestOptions(path: ''),
          ),
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
        ));

        expect(
          () => client.get('/test'),
          throwsA(isA<AuthenticationException>()),
        );
      });

      test('should throw AuthorizationException on 403', () async {
        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenThrow(DioException(
          response: Response(
            statusCode: 403,
            requestOptions: RequestOptions(path: ''),
          ),
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
        ));

        expect(
          () => client.get('/test'),
          throwsA(isA<AuthorizationException>()),
        );
      });

      test('should throw NotFoundException on 404', () async {
        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenThrow(DioException(
          response: Response(
            statusCode: 404,
            requestOptions: RequestOptions(path: ''),
          ),
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
        ));

        expect(
          () => client.get('/test'),
          throwsA(isA<NotFoundException>()),
        );
      });

      test('should throw ValidationException on 400', () async {
        when(mockDio.post(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenThrow(DioException(
          response: Response(
            statusCode: 400,
            data: {
              'errors': {
                'email': ['Invalid email format'],
              },
            },
            requestOptions: RequestOptions(path: ''),
          ),
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
        ));

        expect(
          () => client.post('/test', data: {}),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw ServerException on 500', () async {
        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenThrow(DioException(
          response: Response(
            statusCode: 500,
            requestOptions: RequestOptions(path: ''),
          ),
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
        ));

        expect(
          () => client.get('/test'),
          throwsA(isA<ServerException>()),
        );
      });

      test('should throw NetworkException on connection error', () async {
        when(mockDio.get(any,
                queryParameters: anyNamed('queryParameters'),
                options: anyNamed('options')))
            .thenThrow(DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: ''),
        ));

        expect(
          () => client.get('/test'),
          throwsA(isA<NetworkException>()),
        );
      });
    });

    group('Token management', () {
      test('should set auth token', () {
        client.setAuthToken('test-token');
        expect(client.authToken, equals('test-token'));
      });

      test('should clear auth token', () {
        client.setAuthToken('test-token');
        client.clearAuthToken();
        expect(client.authToken, isNull);
      });
    });
  });
}
