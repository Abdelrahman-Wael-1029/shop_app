import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper/dio_helper.dart';

import '../../../models/home/home_model.dart';
import '../../../shared/constants/constant.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;

  HomeModel? homeData;

  static HomeCubit get(context) => BlocProvider.of(context);

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  void getHomeData() {
    homeData = null;
    emit(GetHomeDataLoadingState());
    DioHelper.getData(
      url: 'home',
      token: Token,
    ).then((value) {
      print(value.data);
      homeData = HomeModel.fromJson(value.data);
      emit(GetHomeDataSuccessState());

    }).catchError((error) {
      emit(GetHomeDataErrorState(error));
    });
  }
}
