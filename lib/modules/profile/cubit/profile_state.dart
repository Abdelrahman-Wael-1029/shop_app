part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileDataLoadingState extends ProfileState {}

class GetProfileDataSuccessState extends ProfileState {}

class GetProfileDataErrorState extends ProfileState {
  final String error;

  GetProfileDataErrorState(this.error);
}

class UpdateProfileDataLoadingState extends ProfileState {}

class UpdateProfileDataSuccessState extends ProfileState {}

class UpdateProfileDataErrorState extends ProfileState {
  final String error;

  UpdateProfileDataErrorState(this.error);
}
