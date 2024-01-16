import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_stop_spectrum/utils/app_constant.dart';
import 'package:game_stop_spectrum/view/auth_ui/onboarding_screen.dart';
import 'package:game_stop_spectrum/view/home_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      logInCheck(context);
    });
  }

  Future<void> logInCheck(BuildContext context) async {
    if (user != null) {
      Get.offAll(() => const HomePage(),
          transition: Transition.fade, duration: const Duration(seconds: 5));
    } else {
      Get.to(() => const OnboardingScreen(), transition: Transition.fade);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstant.black,
      appBar: AppBar(
        backgroundColor: AppConstant.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        width: Get.width.w,
        height: Get.height.h,
        decoration: const BoxDecoration(color: AppConstant.black),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('asset/images/app_logo.svg')),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 20.0).w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('asset/json/loading_animation.json',
                          width: 100,
                          height: 100,
                          animate: true,
                          fit: BoxFit.cover,
                          repeat: true),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        AppConstant.appPoweredBy,
                        style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontFamily: 'Roboto-Bold',
                          fontSize: 12.0.sp,
                        ),
                      )
                    ]),
              )
            ]),
      ),
    );
  }
}
