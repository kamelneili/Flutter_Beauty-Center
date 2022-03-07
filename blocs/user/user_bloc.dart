import 'package:beautycentre/blocs/user/auth_event.dart';
import 'package:beautycentre/blocs/user/auth_state.dart';
import 'package:beautycentre/repositories/User/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<AuthEvent, AuthState> {
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UnAuthenticated()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<SignOutRequested>(_onSignOutRequested);
    // on<SelectDeliveryTime>(_onSelectDeliveryTime);
  }
  final UserRepository _userRepository;

  void _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    try {
      print(event.email);
      await _userRepository.signUp(
          event.email, event.password, event.name, event.phone);
      // yield RegisterState.success();      // emit(
      //   BasketLoaded(
      //     basket: Basket(),
      //   ),
      // );
    } catch (_) {}
  }

  void _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());
    try {
      await _userRepository.signInWithCredentials(event.email, event.password);
      _userRepository.inputData;

      emit(UserLoginSuccessState());
    } catch (_) {
      print("error login");
      emit(LoginErrorState("auth error"));
      emit(UnAuthenticated());
    }
  }

  // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
  void _onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    print("SignOutRequested");
    await _userRepository.signOut();
    emit(UnAuthenticated());
  }
}
