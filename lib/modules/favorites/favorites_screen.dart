import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/styles/style.dart';

import '../../layout/home_layout/cubit/home_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constant.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getFavoritesProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My Favorites",
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
                  condition: cubit.favoritesProducts != null,
                  builder: (context) => ConditionalBuilder(
                    condition: cubit.favoritesProducts!.isNotEmpty,
                    builder: (context)=> showProducts(
                      context,
                      cubit.favoritesProducts!,
                      widthProduct: MediaQuery.of(context).size.width * .4,
                      showFavIcon: false,
                    ),
                    fallback: (context) =>  Center(
                      child: Text("No Favorites Yet",
                        style : getDisplayTextStyle(context),
                      ),
                    ),
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
