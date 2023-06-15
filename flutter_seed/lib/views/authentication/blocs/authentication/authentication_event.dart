abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}
