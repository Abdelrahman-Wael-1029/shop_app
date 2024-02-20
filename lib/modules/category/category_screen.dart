import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/models/category/category_model.dart';
import 'package:shop_app/shared/styles/style.dart';

import '../show_category/show_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.categoryModel != null,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) =>
                  buildCategory(context, cubit.categoryModel!.data.data[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.categoryModel!.data.data.length,
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget buildCategory(context, CategoryDataModel model) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowCategory(
                categoryModel: model,
              ),
            ));
      },
      child: Row(
        children: [
          Image.network(
            model.image,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
