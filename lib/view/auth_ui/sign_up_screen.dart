import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/widget/custom_textfield.dart';
import 'package:get/get.dart';

import '../../controller/google_sign_in_controller.dart';
import '../../services/validator/validator.dart';
import '../../utils/app_constant.dart';
import '../widget/custom_buttons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstant.black,
        appBar: AppBar(
          backgroundColor: AppConstant.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(color: AppConstant.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(children: [
                      Text(
                        'CREATE AN ACCOUNT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 25.sp,
                          fontFamily: 'BebasNeue-Regular',
                        ),
                      ),
                      Text(
                        'Discover  ✩  Experience  ✩  Play',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFF0000),
                          fontSize: 25.sp,
                          fontFamily: 'BebasNeue-Regular',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 357,
                      height: 420,
                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomTextField(
                                  validateInput: (value) =>
                                      Validator.validateName(
                                        name: value,
                                      ),
                                  prefixIcon: const Icon(Icons.account_circle),
                                  controller: _emailTextController,
                                  hintText: "Name",
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 16.0)),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                validateInput: (value) =>
                                    Validator.validateEmail(
                                  email: value,
                                ),
                                prefixIcon: const Icon(Icons.email),
                                controller: _passwordTextController,
                                hintText: "Email",
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 25.0, horizontal: 16.0),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                validateInput: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                controller: _passwordTextController,
                                hintText: "password",
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 25.0, horizontal: 16.0),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomElevatedBtn(
                                height: 60,
                                backgroundColor: AppConstant.appBtnColor,
                                foregroundColor: AppConstant.appMainColor,
                                title: "Sign Up",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                textColor: Colors.white,
                                width: 357,
                              ),
                              Center(
                                child: CustomTextBtn(
                                  title: "Already have an account",
                                  onPressed: () {},
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Or continue with',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontSize: 14.sp,
                              fontFamily: 'Roboto-Bold',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SocialBtn(
                                image: "asset/images/google_icon.svg",
                                onTap: () {
                                  _googleSignInController.signUpWithGoogle();
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SocialBtn(
                                image: "asset/images/phoneIn.svg",
                                onTap: () {},
                              )
                            ],
                          )
                        ]),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
