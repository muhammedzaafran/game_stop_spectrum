import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_stop_spectrum/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
