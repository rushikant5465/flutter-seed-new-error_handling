import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_seed/views/authentication/repos/login_repositories.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository _loginRepository;

  AuthenticationBloc(this._loginRepository) : super(AuthenticationInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      try {
        final data = await _loginRepository.login(event.email, event.password);
        if (data) {
          emit(AuthenticationSuccessState());
        }
      } on Exception catch (_) {
        emit(AuthenticationErrorState());
      }
    });
  }
}
