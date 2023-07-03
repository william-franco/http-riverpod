sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  final S value;

  const Success({required this.value});
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  final E exception;

  const Failure({required this.exception});
}
