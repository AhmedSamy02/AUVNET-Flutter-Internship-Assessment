import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/errors/firebase_failure.dart';
import 'package:nawel/core/errors/unexpected_failure.dart';
import 'package:nawel/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:nawel/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final userCredential = await remoteDataSource.login(email, password);
      final token = await userCredential.user!.getIdToken();
      return Right(token!);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register(String name,String email, String password) async {
    try {
      UserCredential credential = await remoteDataSource.register(email, password);
      credential.user!.updateProfile(displayName: name);
      await credential.user!.reload();
      final token = await credential.user!.getIdToken();
      return Right(token!);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendVerificationEmail(
      String email, String emailLink) async {
    try {
      await remoteDataSource.sendVerificationEmail(email, emailLink);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
