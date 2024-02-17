import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/models/home/home_model.dart';

import '../../models/category/category_model.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constant.dart';
import '../show_category/show_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoryModel != null,
          builder: (context) => buildHome(
            context,
            cubit.homeModel!,
            cubit.categoryModel!,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildHome(context, HomeModel homeModel, CategoryModel categoryModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
              items: homeModel.data.banners
                  .map(
                    (e) => Image.network(
                      e.image,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('');
                      },
                      fit: BoxFit.fill,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: .9,
                initialPage: 7,
                height: 300,
                enableInfiniteScroll: true,
                // autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildCategoryItem(
                      context,
                      categoryModel.data.data[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: categoryModel.data.data.length,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'New Products',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: showProducts(context, homeModel.data.products),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(context, CategoryDataModel model) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShowCategory(
            categoryModel: model,
          );
        }));
      },
      child: Container(
        width: 150,
        height: 150,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(
              model.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                );
              },
            ),
            Container(
              width: double.infinity,
              color: const Color.fromRGBO(0, 0, 0, .8),
              child: Text(
                model.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
