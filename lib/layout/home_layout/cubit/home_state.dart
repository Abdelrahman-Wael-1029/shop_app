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

class ChangeFavoriteSuccessState extends HomeState {}

class ChangeFavoriteErrorState extends HomeState {}

class ShowCategoryLoadingGetProducts extends HomeState {}

class ShowCategorySuccessGetProducts extends HomeState {}

class ShowCategoryErrorGetProducts extends HomeState {}

class GetFavoritesLoading extends HomeState {}

class GetFavoritesSuccess extends HomeState {}

class GetFavoritesError extends HomeState {}

class ChangeDarkModeState extends HomeState {}

class LogoutSuccessState extends HomeState {}

class LogoutErrorState extends HomeState {}

class GetSearchDataLoadingState extends HomeState {}

class GetSearchProductsSuccessState extends HomeState {}

class GetSearchDataErrorState extends HomeState {
  final String error;

  GetSearchDataErrorState(this.error);
}


