import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../controller/verify_phone_controller.dart';
import '../../services/validator/validator.dart';
import '../../utils/app_constant.dart';
import '../widget/custom_buttons.dart';

class VerifyOtp extends StatefulWidget {
  final String verificationId;
  const VerifyOtp({super.key, required this.verificationId});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final _formKey = GlobalKey<FormState>();
  final SentOtpController sentOtpController = Get.put(SentOtpController());
  OtpFieldController otpFieldController = OtpFieldController();
  String enteredOtp = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.black,
        appBar: AppBar(
          title: const Text("SEND OTP",
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
                    height: 100.h,
                  ),
                  Lottie.asset('asset/json/otp.json',
                      width: 150.w,
                      height: 150.h,
                      animate: true,
                      fit: BoxFit.cover,
                      repeat: true),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OTPTextField(
                            otpFieldStyle:
                                OtpFieldStyle(backgroundColor: Colors.white),
                            controller: otpFieldController,
                            length: 6,
                            width: Get.width * 09.w,
                            fieldWidth: 50,
                            style: const TextStyle(fontSize: 17),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            spaceBetween: 5,
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                              enteredOtp = pin;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            child: CustomElevatedBtn(
                              height: 30.h,
                              backgroundColor: AppConstant.appBtnColor,
                              foregroundColor: AppConstant.appMainColor,
                              title: "VERIFY OTP",
                              onPressed: () {
                                validateInput:
                                (value) => Validator.validatePhoneNumber(
                                    phoneNumber: value);
                                sentOtpController.verifyOtp(
                                    enteredOtp, widget.verificationId);
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
