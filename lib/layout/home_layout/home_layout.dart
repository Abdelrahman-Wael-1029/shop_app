import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/modules/home/home_screen.dart';

import '../../modules/category/category_screen.dart';
import '../../modules/favorites/favorites_screen.dart';
import '../../modules/settings/settings_screen.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  var screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                title: const Text('shoppy'),
                surfaceTintColor: Colors.transparent),
            body: screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
