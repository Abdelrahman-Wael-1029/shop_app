import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/login/login_model.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper/dio_helper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  bool isPassword = true;
  IconData suffixIcon = Icons.visibility;

  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    DioHelper.postData(
      url: Login,
      data: FormData.fromMap({
        'email': email,
        'password': password,
      }),
      lang: 'en',
    ).then((value) {
      if (value.data['status'] == true) {
        emit(LoginSuccess(LoginModel.fromJson(value.data)));
      } else {
        emit(LoginSuccessByError(LoginModel.fromJson(value.data)));
      }
    }).catchError((error) {
      print("error in login ${error.toString()}");
      emit(LoginError(error.toString()));
    });
  }
}
