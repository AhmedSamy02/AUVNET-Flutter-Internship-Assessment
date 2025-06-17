import 'failure.dart';

class FirebaseFailure implements Failure {
  @override
  final String message;
  FirebaseFailure({required this.message});

  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return FirebaseFailure(message: 'Please enter a valid email address.');
      case 'user-disabled':
        return FirebaseFailure(
            message: 'Your account has been disabled. Please contact support.');
      case 'user-not-found':
        return FirebaseFailure(message: 'No account found with this email.');
      case 'wrong-password':
        return FirebaseFailure(
            message: 'Incorrect password. Please try again.');
      case 'email-already-in-use':
        return FirebaseFailure(
            message: 'This email is already registered. Try logging in.');
      case 'operation-not-allowed':
        return FirebaseFailure(
            message:
                'This sign-in method is not enabled. Please contact support.');
      case 'weak-password':
        return FirebaseFailure(
            message:
                'Your password is too weak. Please use at least 6 characters.');
      case 'too-many-requests':
        return FirebaseFailure(
            message: 'Too many attempts. Please try again later.');
      case 'network-request-failed':
        return FirebaseFailure(
            message: 'Network error. Please check your internet connection.');
      case 'account-exists-with-different-credential':
        return FirebaseFailure(
            message:
                'An account already exists with this email using a different sign-in method.');
      case 'invalid-credential':
        return FirebaseFailure(message: 'Incorrect email or password.');
      case 'invalid-verification-code':
        return FirebaseFailure(
            message: 'The code you entered is incorrect. Please try again.');
      case 'invalid-verification-id':
        return FirebaseFailure(
            message: 'Verification failed. Please try again.');
      default:
        return FirebaseFailure(
            message: 'Something went wrong. Please try again. [$code]');
    }
  }

  @override
  String toString() => 'FirebaseFailure: $message';
}
