import 'package:beautycentre/models/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class LogoutState extends AuthState {}

class LoginInitState extends AuthState {}

class ForgotPasswordState extends AuthState {}

class PasswordResetSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class ProfilLoadingState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;
  LoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class UserRegisterSuccessState extends AuthState {}

class UserUpdateSuccessState extends AuthState {}

class LoadingState extends AuthState {}

class UpdateLoadingState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String message;
  RegisterErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class DisplayProfileState extends AuthState {
  User user;
  DisplayProfileState({required this.user});
}
