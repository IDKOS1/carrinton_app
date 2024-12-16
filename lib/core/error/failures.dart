abstract class Failure implements Exception {
  final String message;
  const Failure(this.message);
}

class DataSourceFailure extends Failure {
  const DataSourceFailure(super.message);
}

class UseCaseFailure extends Failure {
  const UseCaseFailure(super.message);
}
