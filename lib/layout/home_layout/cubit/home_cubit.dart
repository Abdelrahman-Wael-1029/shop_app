import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/category/category_model.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper/dio_helper.dart';

import '../../../models/home/home_model.dart';
import '../../../shared/constants/constant.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;

  HomeModel? homeModel;
  CategoryModel? categoryModel;

  static HomeCubit get(context) => BlocProvider.of(context);

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  void getHomeData() {
    emit(GetDataLoadingState());
    DioHelper.getData(
      url: Home,
      token: Token,
    ).then((value) {
      print(value.data);
      homeModel = HomeModel.fromJson(value.data);
      emit(GetHomeDataSuccessState());

    }).catchError((error) {
      emit(GetHomeDataErrorState(error));
    });
  }

  void getCategoryData() {
    categoryModel = null;
    emit(GetDataLoadingState());
    DioHelper.getData(
      url: Categories,
      token: Token,
    ).then((value) {
      print(value.data);
      categoryModel = CategoryModel.fromJson(value.data);
      emit(GetCategoryDataSuccessState());

    }).catchError((error) {
      emit(GetCategoryDataErrorState(error));
    });
  }
}
