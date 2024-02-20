import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/modules/profile/profile_screen.dart';
import '../../shared/components/components.dart';

class SettingsModel {
  final String title;
  IconData? icon;
  Function()? onTap;
  bool endArrow = true;

  SettingsModel({
    required this.title,
    this.icon,
    this.onTap,
    this.endArrow = true,
  });
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var settings = [
      SettingsModel(
        title: 'Edit Profile',
        icon: Icons.edit,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
      ),
      SettingsModel(
        title: 'Notifications',
        icon: Icons.notifications,
      ),
      SettingsModel(
        title: 'Cart',
        icon: Icons.shopping_cart,
      ),
      SettingsModel(
        title: 'Orders',
        icon: Icons.shopping_bag,
      ),
      SettingsModel(
        title: 'Log Out',
        endArrow: false,
        icon: Icons.logout,
        onTap: () {
          logout(context);
        },
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildSettingsItem(
              context,
              settingsModel: settings[index],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: settings.length,
          );
        },
      ),
    );
  }

  Widget buildSettingsItem(
    context, {
    required SettingsModel settingsModel,
  }) {
    return InkWell(
      onTap: settingsModel.onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(settingsModel.icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              settingsModel.title,
            ),
            const Spacer(),
            if (settingsModel.endArrow) const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
