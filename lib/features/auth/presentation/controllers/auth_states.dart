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

}
class LoginFailure extends AuthState {
  final String error;
  const LoginFailure({required this.error});
}
class RegisterLoading extends AuthState {
  const RegisterLoading();
}
class RegisterSuccess extends AuthState {
  const RegisterSuccess();
}
class RegisterFailure extends AuthState {
  final String error;
  const RegisterFailure({required this.error});
}
class LogoutSuccess extends AuthState {
  const LogoutSuccess();
}
class LogoutFailure extends AuthState {
  final String error;
  const LogoutFailure({required this.error});
}
class LogoutLoading extends AuthState {
  const LogoutLoading();
}
