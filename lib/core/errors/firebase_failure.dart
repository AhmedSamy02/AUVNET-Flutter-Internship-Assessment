import 'failure.dart';

class FirebaseFailure implements Failure {
  @override
  final String message;
  FirebaseFailure({required this.message});
  
  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return FirebaseFailure(message: 'The email address is not valid.');
      case 'user-disabled':
        return FirebaseFailure(message: 'This user has been disabled.');
      case 'user-not-found':
        return FirebaseFailure(message: 'No user found for this email.');
      case 'wrong-password':
        return FirebaseFailure(message: 'Incorrect password.');
      case 'email-already-in-use':
        return FirebaseFailure(message: 'The email is already in use.');
      case 'operation-not-allowed':
        return FirebaseFailure(message: 'Operation not allowed.');
      case 'weak-password':
        return FirebaseFailure(message: 'The password is too weak.');
      case 'too-many-requests':
        return FirebaseFailure(message: 'Too many requests. Try again later.');
      case 'network-request-failed':
        return FirebaseFailure(message: 'Network error. Please check your connection.');
      default:
        return FirebaseFailure(message: 'An unknown error occurred.');
    }
  }

  @override
  String toString() => 'FirebaseFailure: $message';
}