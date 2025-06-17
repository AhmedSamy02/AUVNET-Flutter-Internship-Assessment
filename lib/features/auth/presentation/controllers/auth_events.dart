sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({
    required this.email,
    required this.password,
  });
}
final class AuthRegisterRequested extends AuthEvent {
  final String email;
  final String password;

  AuthRegisterRequested({
    required this.email,
    required this.password,
  });
}
final class AuthLogoutRequested extends AuthEvent {
  AuthLogoutRequested();
}