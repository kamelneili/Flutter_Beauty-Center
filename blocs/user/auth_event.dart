import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends AuthEvent {}

class ForgotPassword extends AuthEvent {
  final String email;

  ForgotPassword({required this.email});

  // @override
  List<Object> get props => [email];
}

class LoggedOut extends AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOutRequested extends AuthEvent {}

class ResetButtonPressed extends AuthEvent {
  final String email;
  final String password;

  ResetButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class DisplayProfileEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class RegisterButtonPressed extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phone;
  // final String firstName, ln, add;

  RegisterButtonPressed({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class UpdateButtonPressed extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  UpdateButtonPressed(
      {required this.phone,
      required this.email,
      required this.password,
      required this.name});

  @override
  List<Object> get props => [phone, email, password, name];
}
