import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/widget/custom_textfield.dart';

import '../../services/validator/validator.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pop(); // Close the bottom sheet when tapped outside
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                'Please enter your address',
                style: TextStyle(fontFamily: 'Anton-Regular', fontSize: 25.sp),
              ),
              CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  validateInput: (value) => Validator.validateEmail(
                        email: value,
                      ),
                  prefixIcon: const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  controller: _emailTextController,
                  hintText: "Name",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 16.0)),
            ],
          ),
        ),
      ),
    );
  }
}
