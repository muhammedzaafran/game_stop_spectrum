import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';

class CustomElevatedBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? fontFamily;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double width;
  final Widget? child;
  final double radius;
  final BorderSide? side;
  final String title;
  const CustomElevatedBtn({
    Key? key,
    this.side,
    required this.width,
    required this.height,
    this.onPressed,
    this.fontFamily,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
    this.radius = 10,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: side,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size(width, height),
        shadowColor: AppConstant.black,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: child ??
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
    );
  }
}
