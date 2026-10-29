abstract class Failure {
  final String statusCode;
  final String message;
  const Failure(this.statusCode, this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.statusCode, super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.statusCode, super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.statusCode, super.message);
}
