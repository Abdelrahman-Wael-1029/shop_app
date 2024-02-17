import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/shared/network/remote/dio_helper/dio_helper.dart';

import '../../../models/category/category_model.dart';
import '../../../models/home/home_model.dart';
import '../../../shared/network/end_points.dart';

part 'show_category_state.dart';

class ShowCategoryCubit extends Cubit<ShowCategoryState> {
  final CategoryDataModel categoryModel;
  List<ProductsModel> productsModel = [];

  ShowCategoryCubit(this.categoryModel) : super(ShowCategoryInitial());

  static ShowCategoryCubit get(context) => BlocProvider.of(context);

  void getProducts() {
    emit(ShowCategoryLoadingGetProducts());

    DioHelper.getData(url: Products, query: {
      'category_id': categoryModel.id,
    }).then((value) {
      productsModel = [];

      value.data['data']['data'].forEach((element) {
        productsModel.add(ProductsModel.fromJson(element));
      });

      print(productsModel.toString());

      emit(ShowCategorySuccessGetProducts());

    }).catchError((error) {
      print(error.toString());
      emit(ShowCategoryErrorGetProducts());
    });
  }
}
