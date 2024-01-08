import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/widget/custom_buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_constant.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
                Expanded(
                  child: Lottie.asset('asset/json/onboarding_screen.json',
                      animate: true,
                      fit: BoxFit.cover,
                      repeat: true),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 50.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 343.w,
                          child: Text(
                            'Discover Your Dream Game deals here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFFFD771),
                              fontSize: 32.sp,
                              fontFamily: 'Roboto-Bold',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 323.w,
                          child: Text(
                            'Explore all the latest games',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Roboto-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ]),
                ),
                Container(
                  alignment: Alignment.center,
                  height:200,child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  CustomElevatedBtn(width: 160, height: 60,backgroundColor: AppConstant.appBtnColor,title: "Login",onPressed: () {

                  },),
                  CustomElevatedBtn(width: 160, height: 60,backgroundColor: AppConstant.appBtnColor,title: "Register",onPressed: () {

                  },)
                ]),)
              ],
            )),
      ),
    );
  }
}
