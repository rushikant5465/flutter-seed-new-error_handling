abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {}
