import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/email_sign_in_controller.dart';
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
        body: Container(
            alignment: Alignment.center,
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(color: AppConstant.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('asset/json/qstnmark.json',
                    width: 150,
                    height: 150,
                    animate: true,
                    fit: BoxFit.cover,
                    repeat: true),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.85,
                          height: 90,
                          child: const CustomTextField(
                            prefixIcon: Icon(Icons.email,color: Colors.black,),
                            hintText: " Enter mail",
                          ),
                        ),
                        SizedBox(
                          child: CustomElevatedBtn(
                            height: 40,

                            backgroundColor: AppConstant.appBtnColor,
                            foregroundColor: AppConstant.appMainColor,
                            title: "Reset Password",
                            onPressed: () {
                              String email = _emailTextController.text.trim();
                              if (email.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Please enter all details",
                                  snackPosition: SnackPosition.TOP,
                                );
                              } else {
                                _emailPassController.forgotPassword(email);
                              }
                            },
                            textColor: Colors.white,
                            width: Get.width * 0.30,
                          ),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
