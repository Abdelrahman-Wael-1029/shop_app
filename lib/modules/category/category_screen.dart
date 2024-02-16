import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/models/category/category_model.dart';

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
          return ListView.separated(
            itemBuilder: (context, index) => buildCategory(context, cubit.categoryModel!.data.data[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: cubit.categoryModel!.data.data.length,
          );
        },
      ),
    );
  }

  Widget buildCategory(context, CategoryDataModel model) {
    return Row(
      children: [
        Image.network(model.image,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
          width: 100,
          height: 100,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(model.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
