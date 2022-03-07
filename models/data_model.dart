import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final int id;
  String phone;
  User(
      {required this.name,
      required this.email,
      required this.id,
      required this.phone});
  @override
  List<Object?> get props => [id, name, phone, email];
  // static User.fromJson(Map<String, dynamic> json, this.name, this.email, this.id) {
  //   if (json['data'] != null) {
  //     name = json['data']['name'];
  //           id = json['data']['id'];
  //   phone=json['data']['phone'];
  //     email = json['data']['email'];
  //   } else {
  //     name = "";
  //     email = "";
  //   }
  // }
}

class Logout {
  late final String message;

  Logout({required this.message});

  Logout.fromJson(Map<String, dynamic> json, this.message) {
    message = json['message'];
  }
}
