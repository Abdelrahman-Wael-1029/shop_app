import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/models/home/home_model.dart';

import '../../models/category/category_model.dart';
import '../../shared/constants/constant.dart';

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
                GridView.count(
                  crossAxisCount:
                      max(MediaQuery.of(context).size.width ~/ widthProduct, 1),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: widthProduct / heightProduct,
                  children: List.generate(
                    homeModel.data.products.length,
                    (index) => buildProducts(homeModel.data.products[index]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(CategoryDataModel model) {
    return Container(
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
    );
  }

  Widget buildProducts(ProductsModel model) {
    return Container(
      width: widthProduct,
      height: heightProduct,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.network(
                model.image,
                width: widthProduct,
                height: 200,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('');
                },
              ),
              if (model.discount != 0)
                Container(
                  color: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.discount_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: Text(''),
          ),
          Row(
            children: [
              Text(
                "${model.price.round()}",
                style: const TextStyle(
                  color: AppColors.fourthColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              if (model.discount != 0)
                Text(
                  "${model.old_price.round()}",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
