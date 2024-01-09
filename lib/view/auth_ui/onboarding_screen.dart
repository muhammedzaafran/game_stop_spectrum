import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/auth_ui/sign_in_screen.dart';
import 'package:game_stop_spectrum/view/auth_ui/sign_up_screen.dart';
import 'package:game_stop_spectrum/view/widget/custom_buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_constant.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
        body: Container(
            alignment: Alignment.center,
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(color: AppConstant.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Lottie.asset('asset/json/astroboymain.json',
                      animate: true, repeat: true),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 343.w,
                          child: Text(
                            'GAME ON AT GAME STOP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFFF0000),
                              fontSize: 35.sp,
                              fontFamily: 'BebasNeue-Regular',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 323.w,
                          child: Text(
                            'Immerse yourself in a dynamic virtual marketplace.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Roboto-Regular',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ]),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedBtn(
                          width: 160,
                          height: 60,
                          backgroundColor: AppConstant.appBtnColor,
                          title: "Login",
                          onPressed: () {
                            Get.off(() => const SignInPage(),
                                transition: Transition.leftToRightWithFade);
                          },
                          textColor: Colors.white,
                        ),
                        CustomElevatedBtn(
                          width: 160,
                          height: 60,
                          backgroundColor: AppConstant.appBtnColor,
                          foregroundColor: AppConstant.appMainColor,
                          title: "Register",
                          onPressed: () {
                            Get.to(() => const SignUpPage(),
                                transition: Transition.leftToRightWithFade);
                          },
                          textColor: Colors.white,
                        ),
                      ]),
                )
              ],
            )),
      ),
    );
  }
}
