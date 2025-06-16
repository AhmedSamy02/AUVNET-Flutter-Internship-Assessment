import 'failure.dart';

class UnexpectedFailure implements Failure {
  @override
  final String message;

  UnexpectedFailure({required this.message});
}
