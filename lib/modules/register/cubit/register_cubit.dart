import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/register/register_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  bool isPassword = true;
  IconData suffixIcon = Icons.visibility;

  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }

  void register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoading());
    DioHelper.postData(
      url: Register,
      data: FormData.fromMap({
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
      }),
      lang: 'en',
    ).then((value) {
      if (value.data['status'] == true) {
        emit(RegisterSuccess(RegisterModel.fromJson(value.data)));
      } else {
        emit(RegisterSuccessByError(RegisterModel.fromJson(value.data)));
      }
    }).catchError((error) {
      print(error.toString());
      emit(RegisterError(error.toString()));
    });
  }
}
