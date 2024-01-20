import 'package:flutter/material.dart';
import 'package:game_stop_spectrum/utils/app_constant.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validateInput;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.contentPadding = const EdgeInsets.fromLTRB(13, 14, 13, 14),
    this.controller,
    this.validateInput,
    this.obscureText = false,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validateInput,
      controller: controller,
      obscureText: obscureText,

      cursorColor: AppConstant.appMainColor, // Set the cursor color here
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: const TextStyle(
          color: Color(0xFF616161),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: contentPadding,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const OutlineInputBorder(),
      ),
    );
  }
}
