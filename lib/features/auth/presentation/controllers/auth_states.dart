sealed class AuthState {
  const AuthState();
}
class AuthInitial extends AuthState {
  const AuthInitial();
}
class LoginLoading extends AuthState {
  const LoginLoading();
}
class LoginSuccess extends AuthState {
  final String token;

  const LoginSuccess({required this.token});
}
class LoginFailure extends AuthState {
  final String error;
  const LoginFailure({required this.error});
}