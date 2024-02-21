import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/category/category_model.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper/dio_helper.dart';

import '../../../models/home/home_model.dart';
import '../../../shared/constants/constant.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    loadSystemMode();
  }

  int currentIndex = 0;
  bool isDark = false;

  HomeModel? homeModel; // for all pruducts in home
  CategoryModel? categoryModel; // for all categories
  List<ProductsModel> productsModel = []; // for all products in category screen

  static HomeCubit get(context) => BlocProvider.of(context);

  void loadSystemMode() {
    CacheHelper.getData(key: 'isDark').then((value) {
      isDark = value ?? false;
      emit(ChangeDarkModeState());
    });
  }

  void changeDarkMode() {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(ChangeDarkModeState());
    });
  }

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
      homeModel = HomeModel.fromJson(value.data);
      emit(GetHomeDataSuccessState());
    }).catchError((error) {
      emit(GetHomeDataErrorState(error));
    });
  }

  List<ProductsModel>? favoritesProducts;

  void getFavoritesProducts() {
    favoritesProducts = [];
    try {
      emit(GetFavoritesLoading());
      homeModel!.data.products.forEach((element) {
        if (element.in_favorites) {
          favoritesProducts!.add(element);
        }
      });
      emit(GetFavoritesSuccess());
    } catch (error) {
      emit(GetFavoritesError());
    }
  }

  void getCategoryData() {
    categoryModel = null;
    emit(GetDataLoadingState());
    DioHelper.getData(
      url: Categories,
      token: Token,
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      emit(GetCategoryDataSuccessState());
    }).catchError((error) {
      emit(GetCategoryDataErrorState(error));
    });
  }

  void changeFavorite(ProductsModel productsModel) {
    productsModel.in_favorites = !productsModel.in_favorites;
    emit(ChangeFavoriteSuccessState());
    DioHelper.postData(
      url: Favourites,
      token: Token,
      data: FormData.fromMap(
        {
          'product_id': productsModel.id,
        },
      ),
    ).then((value) {
      if (value.data['status'] == false) {
        throw 'Not change favorite status';
      }
      homeModel!.data.products.forEach((element) {
        if (element.id == productsModel.id) {
          element.in_favorites = productsModel.in_favorites;
        }
      });

      emit(ChangeFavoriteSuccessState());
    }).catchError((error) {
      productsModel.in_favorites = !productsModel.in_favorites;

      homeModel!.data.products.forEach((element) {
        if (element.id == productsModel.id) {
          element.in_favorites = productsModel.in_favorites;
        }
      });

      emit(ChangeFavoriteErrorState());
    });
  }

  void getCategoryProducts(CategoryDataModel categoryModel) {
    productsModel = [];
    emit(ShowCategoryLoadingGetProducts());

    DioHelper.getData(
      url: Products,
      token: Token,
      query: {
        'category_id': categoryModel.id,
      },
    ).then((value) {
      productsModel = [];

      value.data['data']['data'].forEach((element) {
        productsModel.add(ProductsModel.fromJson(element));
      });
      emit(ShowCategorySuccessGetProducts());
    }).catchError((error) {
      emit(ShowCategoryErrorGetProducts());
    });
  }

  List<ProductsModel> searchProducts =[];

  void getSearchProducts(String text) {
    emit(GetSearchDataLoadingState());
    DioHelper.postData(
        url: Search,
        data: FormData.fromMap({
          'text': text,
        })).then((value) {
      if (value.data['status'] == false) {
        throw value.data['message'];
      }
      value.data['data']['data'].forEach((element) {
        searchProducts.add(ProductsModel.fromJson(element));
      });
      emit(GetSearchProductsSuccessState());
    }).catchError((error) {
      emit(GetSearchDataErrorState(error.toString()));
    });
  }

  void logout() {
    CacheHelper.removeData(key: 'token').then((value) {
      Token = '';
      emit(LogoutSuccessState());
    });
  }
}
