import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, void>> register(String email, String password);
  Future<Either<Failure, void>> sendVerificationEmail(
      String email, String emailLink);
  Future<Either<Failure, void>> logout();
}
