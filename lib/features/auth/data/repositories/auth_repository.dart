import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/core/constants/functions.dart';
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
      final token = userCredential.user!.uid;
      return Right(token);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register(String email, String password) async {
    try {
      UserCredential credential =
          await remoteDataSource.register(email, password);
      await credential.user!
          .updateDisplayName(email.split('@')[0].split('.')[0]);
      await credential.user!.reload();
      String name = credential.user!.displayName ?? 'User';
      FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'email': email,
        'name': name.capitalize(),
        'id': credential.user!.uid,
        'nearest_stores': [],
      });
      return const Right(null);
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
