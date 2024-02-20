import '../user/user_modell.dart';

class LoginModel{
  late bool status;
  late String message;
  UserModel ?data;

  LoginModel({
    required this.status,
    required this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }
}

