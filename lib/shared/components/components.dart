import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop_app/shared/constants/constant.dart';

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

}){
  showToast(
    message,
    context: context,
    position: position,
    duration: duration,
    backgroundColor: AppColors.secondaryColor,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}

