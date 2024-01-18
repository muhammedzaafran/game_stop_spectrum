import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/auth_ui/sentotp.dart';
import 'package:game_stop_spectrum/view/auth_ui/sign_in_screen.dart';
import 'package:game_stop_spectrum/view/widget/custom_textfield.dart';
import 'package:get/get.dart';

import '../../controller/email_sign_in_controller.dart';
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
  final _nameTextController = TextEditingController();
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());
  final EmailPassController _emailPassController =
      Get.put(EmailPassController());

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
                                  prefixIcon: const Icon(Icons.account_circle, color: Colors.black,),
                                  controller: _nameTextController,
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
                                prefixIcon: const Icon(Icons.email, color: Colors.black,),
                                controller: _emailTextController,
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
                                prefixIcon: const Icon(Icons.lock, color: Colors.black),
                                controller: _passwordTextController,
                                hintText: "Password",
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
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await _emailPassController.signupUser(
                                        _emailTextController.text,
                                        _passwordTextController.text,
                                        _nameTextController.text);
                                    await _emailPassController
                                        .checkCurrentUser();
                                  }
                                },
                                textColor: Colors.white,
                                width: 357,
                              ),
                              Center(
                                child: CustomTextBtn(
                                  title: "Already have an account",
                                  onPressed: () {
                                    Get.to(() => const SignInPage(),
                                        transition: Transition.leftToRightWithFade);
                                  },
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
                                onTap: () {
                                  Get.to(() => const SendOtpPno());
                                },
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
