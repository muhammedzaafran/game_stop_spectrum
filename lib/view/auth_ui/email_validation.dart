import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../controller/email_validation_controller.dart';
import '../../utils/app_constant.dart';
import '../home_page.dart';
import '../widget/custom_buttons.dart';

class EmailValidationScreen extends StatefulWidget {
  final User user;
  const EmailValidationScreen({super.key, required this.user});

  @override
  State<EmailValidationScreen> createState() => _EmailValidationScreenState();
}

class _EmailValidationScreenState extends State<EmailValidationScreen> {
  final EmailValidationController emailValidationController =
      Get.put(EmailValidationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.black,
        appBar: AppBar(
          title:  Text("VERIFY YOUR EMAIL ADDRESS",
              style: TextStyle(fontSize: 26.sp, fontFamily: 'BebasNeue-Regular')),
          centerTitle: true,
          backgroundColor: AppConstant.transparent,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('asset/json/verify.json',
                  width: 250.w, height: 150.h, animate: true, repeat: true),
              Container(
                width: Get.width * 0.5.w,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.white, width: 2.0.w), // Add border
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Text(
                          "Name :  ${widget.user.displayName}",
                          style:  TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(8.0.w),
                        child: Text(
                          "Email : ${widget.user.email}",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 18.h,
              ),
              Column(
                children: [
                   Text(
                    "Email is not verified",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                 SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: CustomElevatedBtn(
                          height: 35.h,
                          backgroundColor: AppConstant.appBtnColor,
                          foregroundColor: AppConstant.appMainColor,
                          title: "Verify",
                          onPressed: () {
                            emailValidationController
                                .sendingEmailVerification(widget.user);
                          },
                          textColor: Colors.white,
                          width: Get.width * 0.20.w,
                        ),
                      ),
                      SizedBox(width: 18.w,),
                      InkWell(
                        onTap: () async {
                          try {
                            User? user = await emailValidationController
                                .refreshEmail(widget.user);
                            if (user != null && user.emailVerified) {
                              Get.snackbar('Success : ',
                                  'Email has been verified successfully',  colorText: Colors.white,
                                snackStyle: SnackStyle.GROUNDED,);
                              Get.off(const HomePage(),
                                  transition: Transition.leftToRightWithFade);
                            } else {
                              Get.snackbar('Failed : ',
                                  'Email has been not verified check your mail', colorText: Colors.white,
                                snackStyle: SnackStyle.GROUNDED,);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                          child: const Row(
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Check",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
