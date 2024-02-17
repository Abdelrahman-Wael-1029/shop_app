import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/show_category/cubit/show_category_cubit.dart';

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
  _ShowCategoryState(this.categoryModel);

  final CategoryDataModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryModel.name,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Image.network(
                categoryModel.image,
                width: double.infinity,
                height: heightProduct,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "List of ${categoryModel.name} Products:",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocProvider(
                create: (context) => ShowCategoryCubit(categoryModel)..getProducts(),
                child: BlocConsumer<ShowCategoryCubit, ShowCategoryState>(
                  listener: (context, state) {
                    if (state is ShowCategorySuccessGetProducts) {
                      print(
                          "length: ::::: ${ShowCategoryCubit.get(context).productsModel.length}");
                    }
                  },
                  builder: (context, state) {
                    var cubit = ShowCategoryCubit.get(context);
                    return ConditionalBuilder(
                      condition: cubit.productsModel.isNotEmpty,
                      builder: (context) => buildListProducts(context),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListProducts(context) {
    var cubit = ShowCategoryCubit.get(context);
    return showProducts(context, cubit.productsModel);
  }
}
