import 'package:dio/dio.dart';

class SessionExpiredException extends DioException {
  SessionExpiredException({
    required RequestOptions requestOptions,
    Response<dynamic>? response,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'SESSION_EXPIRED',
          message: 'Session expired',
        );
}