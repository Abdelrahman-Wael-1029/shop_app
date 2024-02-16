part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel;

  RegisterSuccess(this.registerModel);
}

class RegisterSuccessByError extends RegisterState {
  final RegisterModel registerModel;

  RegisterSuccessByError(this.registerModel);
}

class RegisterError extends RegisterState {
  final String error;

  RegisterError(this.error);
}


class ChangePasswordVisibility extends RegisterState{}

