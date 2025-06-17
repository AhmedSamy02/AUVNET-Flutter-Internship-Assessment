import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, String>> register(
      String name, String email, String password);
  Future<Either<Failure, void>> sendVerificationEmail(
      String email, String emailLink);
  Future<Either<Failure, void>> logout();
}
