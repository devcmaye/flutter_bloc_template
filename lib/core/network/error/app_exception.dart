abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(
    this.message, {
    this.statusCode,
  });
}

class TimeoutException extends AppException {
  TimeoutException(
    super.message, {
    super.statusCode,
  });
}

class NetworkException extends AppException {
  NetworkException(
    super.message, {
    super.statusCode,
  });
}

class ServerException extends AppException {
  ServerException(
    super.message, {
    super.statusCode,
  });
}

class UnknownException extends AppException {
  UnknownException(
    super.message, {
    super.statusCode,
  });
}

class SessionExpiredAppException extends AppException {
  SessionExpiredAppException(
    super.message, {
    super.statusCode,
  });
}