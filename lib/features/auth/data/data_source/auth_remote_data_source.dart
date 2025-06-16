import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> login(String email, String password);
  Future<UserCredential> register(String email, String password);
  Future<UserCredential> sendVerificationEmail(String email, String emailLink);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserCredential> login(String email, String password) async =>
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<UserCredential> register(String email, String password) =>
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<UserCredential> sendVerificationEmail(
          String email, String emailLink) =>
      FirebaseAuth.instance
          .signInWithEmailLink(email: email, emailLink: emailLink);
  @override
  Future<void> logout() => FirebaseAuth.instance.signOut();
  

}
