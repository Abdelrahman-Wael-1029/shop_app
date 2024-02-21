import 'package:shop_app/models/user/user_modell.dart';

class ProfileModel{
  bool status ;
  String ?message;
  UserModel ?data;

  ProfileModel({
    required this.status,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}