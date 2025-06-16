import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(
      String name, String email, String password);
  Future<Either<Failure, void>> sendVerificationEmail(
      String email, String emailLink);
  Future<Either<Failure, void>> logout();
}
