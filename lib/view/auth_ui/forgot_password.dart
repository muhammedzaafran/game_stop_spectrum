import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/email_sign_in_controller.dart';
import '../../services/validator/validator.dart';
import '../../utils/app_constant.dart';
import '../widget/custom_buttons.dart';
import '../widget/custom_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final EmailPassController _emailPassController =
      Get.put(EmailPassController());
  final _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.black,
        appBar: AppBar(
          title: const Text("FORGOT PASSWORD",
              style: TextStyle(fontSize: 35, fontFamily: 'BebasNeue-Regular')),
          centerTitle: true,
          backgroundColor: AppConstant.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              decoration: const BoxDecoration(color: AppConstant.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Lottie.asset('asset/json/qstnmark.json',
                        width: 100.w,
                        height: 100.h,
                        animate: true,
                        fit: BoxFit.cover,
                        repeat: true),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width * 0.85.w,
                            height: 90.h,
                            child: CustomTextField(
                              controller: _emailTextController,
                              keyboardType: TextInputType.emailAddress,
                              validateInput: (value) => Validator.validateEmail(
                                email: value,
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: " Enter mail",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0.h, horizontal: 12.0.w)
                            ),
                          ),
                          SizedBox(
                            child: CustomElevatedBtn(
                              height: 30.h,
                              backgroundColor: AppConstant.appBtnColor,
                              foregroundColor: AppConstant.appMainColor,
                              title: "Reset Password",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  String email = _emailTextController.text.trim();
                                  print(email);
                                  if (email.isEmpty) {
                                    Get.snackbar(
                                      "Error",
                                      "Please enter all details",
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  } else {
                                    _emailPassController.forgotPassword(email);
                                  }
                                }
                              },
                              textColor: Colors.white,
                              width: Get.width * 0.30.w,
                            ),
                          ),
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
