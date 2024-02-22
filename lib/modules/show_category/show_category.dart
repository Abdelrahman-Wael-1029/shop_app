import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/shared/styles/style.dart';

import '../../models/category/category_model.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constant.dart';

class ShowCategory extends StatefulWidget {
  const ShowCategory({
    super.key,
    required this.categoryModel,
  });

  final CategoryDataModel categoryModel;

  @override
  State<ShowCategory> createState() => _ShowCategoryState(categoryModel);
}

class _ShowCategoryState extends State<ShowCategory> {
  _ShowCategoryState(
    this.categoryModel,
  );

  final CategoryDataModel categoryModel;

  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getCategoryProducts(categoryModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryModel.name,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: categoryModel.id,
                child: Image.network(
                  widget.categoryModel.image,
                  width: double.infinity,
                  height: heightProduct,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Products",
                style: getDisplayTextStyle(context)!.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = HomeCubit.get(context);
                  return ConditionalBuilder(
                    condition: cubit.productsModel.isNotEmpty,
                    builder: (context) => buildListProducts(context),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListProducts(context) {
    var cubit = HomeCubit.get(context);
    return showProducts(
      context,
      cubit.productsModel,
      widthProduct: MediaQuery.of(context).size.width * .45,
    );
  }
}
