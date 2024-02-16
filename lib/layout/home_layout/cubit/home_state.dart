part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {}

class GetDataLoadingState extends HomeState {}

class GetHomeDataSuccessState extends HomeState {}

class GetHomeDataErrorState extends HomeState {
  final String error;

  GetHomeDataErrorState(this.error);
}

class GetCategoryDataSuccessState extends HomeState {}

class GetCategoryDataErrorState extends HomeState {
  final String error;

  GetCategoryDataErrorState(this.error);
}
