import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/auth_ui/forgot_password.dart';
import 'package:game_stop_spectrum/view/auth_ui/sentotp.dart';
import 'package:game_stop_spectrum/view/auth_ui/sign_up_screen.dart';
import 'package:game_stop_spectrum/view/home_page.dart';
import 'package:game_stop_spectrum/view/widget/custom_textfield.dart';
import 'package:get/get.dart';
import '../../controller/email_sign_in_controller.dart';
import '../../controller/google_sign_in_controller.dart';
import '../../controller/password_visibility_controller.dart';
import '../../services/validator/validator.dart';
import '../../utils/app_constant.dart';
import '../widget/custom_buttons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());
  final EmailPassController _emailPassController =
      Get.put(EmailPassController());
  final PasswordVisibilityController _passwordVisibilityController =
      Get.put(PasswordVisibilityController());

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
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              decoration: const BoxDecoration(color: AppConstant.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(children: [
                      Text(
                        'LOGIN HERE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 25.sp,
                          fontFamily: 'BebasNeue-Regular',
                        ),
                      ),
                      Text(
                        'WELCOME BACK GAMERS',
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
                      width: Get.width*0.85.w,
                      height: 369.h,
                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextField(
                                  keyboardType: TextInputType.emailAddress,
                                  validateInput: (value) =>
                                      Validator.validateEmail(
                                        email: value,
                                      ),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  controller: _emailTextController,
                                  hintText: "Email",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0.h, horizontal: 12.0.w)),
                              SizedBox(
                                height: 15.h,
                              ),
                              Obx(() => CustomTextField(
                                keyboardType: TextInputType.text,
                                    validateInput: (value) =>
                                        Validator.validatePassword(
                                      password: value,
                                    ),
                                    obscureText: _passwordVisibilityController
                                        .passwordVisible.value,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _passwordVisibilityController
                                              .updateVisibility();
                                        },
                                        icon: Icon(_passwordVisibilityController
                                                .passwordVisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility),color: Colors.black),
                                    prefixIcon: const Icon(Icons.lock,
                                        color: Colors.black),
                                    controller: _passwordTextController,
                                    hintText: "Password",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0.h, horizontal: 12.0.w),
                                  )),
                              Container(
                                alignment: Alignment.topRight,
                                child: CustomTextBtn(
                                  title: "Forgot password?",
                                  foregroundColor: Colors.white,
                                  onPressed: () {
                                    Get.to(() => const ForgotPasswordPage());
                                  },
                                  width: 10.w,
                                  height: 10.h,
                                ),
                              ),
                              CustomElevatedBtn(
                                height: 40.h,
                                backgroundColor: AppConstant.appBtnColor,
                                foregroundColor: AppConstant.appMainColor,
                                title: "Sign In",
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      UserCredential? userCredential =
                                          await _emailPassController.signinUser(
                                        _emailTextController.text,
                                        _passwordTextController.text,
                                      );
                                      if (userCredential!.user!.emailVerified) {
                                        Get.off(() => const HomePage(),
                                            transition:
                                                Transition.leftToRightWithFade);
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                },
                                textColor: Colors.white,
                                width: Get.width*0.85.w,
                              ),
                              Center(
                                child: CustomTextBtn(
                                  title: "Create new account",
                                  foregroundColor: Colors.white,
                                  onPressed: () {
                                    Get.to(() => const SignUpPage());
                                  },
                                  width: 10.w,
                                  height: 10.h,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
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
                          SizedBox(
                            height: 10.h,
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
                              SizedBox(
                                width: 10.w,
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
