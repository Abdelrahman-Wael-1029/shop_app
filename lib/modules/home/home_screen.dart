import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/models/home/home_model.dart';

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
          condition: cubit.homeData != null,
          builder: (context) => buildHome(context, cubit.homeData!),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildHome(context, HomeModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
              items: model.data.banners
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              crossAxisCount:
                  max(MediaQuery.of(context).size.width ~/ widthProduct, 1),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 2,
              crossAxisSpacing: 10,
              childAspectRatio: widthProduct / heightProduct,
              children: List.generate(
                model.data.products.length,
                (index) => buildProducts(model.data.products[index]),
              ),
            ),
          ),
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
