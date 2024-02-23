import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop_app/shared/constants/constant.dart';

import '../../layout/home_layout/cubit/home_cubit.dart';
import '../../models/home/home_model.dart';
import '../../modules/login/login_screen.dart';
import '../../modules/show_product/show_product.dart';
import '../styles/style.dart';

Widget defaultTextFormField({
  required Widget label,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool obscureText = false,
  TextEditingController? controller,
  String? Function(String?)? validator,
  required TextInputType keyboardType,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    decoration: InputDecoration(
      label: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    ),
    obscureText: obscureText,
    controller: controller,
    validator: validator,
  );
}

Widget defaultFormButton({
 required context,
  required String text,
  required Function() onPressed,
}) {
  return MaterialButton(
    minWidth: double.infinity,
    onPressed: onPressed,
    color: AppColors.fourthColor,
    textColor: Colors.white,
    child: Text(
      text,
      style: getLabelTextStyle(context)!.copyWith(
        color: Colors.white,
      ),
    ),
  );
}

defaultShowToast({
  required String message,
  required BuildContext context,
  StyledToastPosition position = StyledToastPosition.top,
  Duration duration = const Duration(seconds: 4),
}) {
  showToast(
    message,
    context: context,
    position: position,
    duration: duration,
    backgroundColor: AppColors.secondaryColor,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}

Widget showProducts(
  context,
  List<ProductsModel> products, {
  double heightProduct = heightProduct,
  double widthProduct = widthProduct,
  bool showFavIcon = true,
}) {
  return Wrap(
    alignment: WrapAlignment.spaceEvenly,
    runSpacing: 10,
    spacing: 20,
    children: List.generate(
      products.length,
      (index) => buildProducts(
        context,
        products[index],
        heightProduct: heightProduct,
        widthProduct: widthProduct,
        showFavIcon: showFavIcon,
      ),
    ),
  );
}

Widget buildProducts(
  context,
  ProductsModel model, {
  double heightProduct = heightProduct,
  double widthProduct = widthProduct,
  bool showFavIcon = true,
}) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ShowProduct(
          productsModel: model,
        );
      }));
    },
    child: SizedBox(
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
                height: 150,
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
            style: getHeadlineTextStyle(context),
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
                style: getBodyTextStyle(context)!.copyWith(
                      color: getColorPrice(context),
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              if (model.discount != null &&model.old_price != null && model.discount != 0)
                // white lineThrough
                Text(
                  "${model.old_price.round()}",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    decorationColor:
                        Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              const Spacer(),
              if (showFavIcon)
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<HomeCubit>(context).changeFavorite(model);
                    },
                    icon: favoriteIcon(
                      model.in_favorites,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget favoriteIcon(bool isFavorite) {
  return Icon(
    (isFavorite) ? Icons.favorite : Icons.favorite_border,
    color: AppColors.secondaryColor,
    key: ValueKey(isFavorite),
  );
}

void logout(context) {
  HomeCubit.get(context).logout();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
}
