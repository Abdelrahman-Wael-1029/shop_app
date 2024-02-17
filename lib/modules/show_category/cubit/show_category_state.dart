part of 'show_category_cubit.dart';

@immutable
abstract class ShowCategoryState {}

class ShowCategoryInitial extends ShowCategoryState {}

class ShowCategoryLoadingGetProducts extends ShowCategoryState {}

class ShowCategorySuccessGetProducts extends ShowCategoryState {}

class ShowCategoryErrorGetProducts extends ShowCategoryState {}




