import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop_app/shared/constants/constant.dart';

import '../../models/home/home_model.dart';
import '../../modules/show_product/show_product.dart';

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

Widget showProducts(context, List<ProductsModel> products) {
  return Wrap(
    alignment: WrapAlignment.spaceEvenly,
    runSpacing: 10,
    spacing: 20,
    children: List.generate(
      products.length,
          (index) => buildProducts(
          context, products[index]),
    ),
  );
}

Widget buildProducts(context, ProductsModel model) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ShowProduct(
          productsModel: model,
        );
      }));
    },
    child: Container(
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
    ),
  );
}


