import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/verify_phone_controller.dart';
import '../../utils/app_constant.dart';
import '../widget/custom_buttons.dart';
import '../widget/custom_textfield.dart';

class SendOtpPno extends StatefulWidget {
  const SendOtpPno({super.key});

  @override
  State<SendOtpPno> createState() => _SendOtpPnoState();
}

class _SendOtpPnoState extends State<SendOtpPno> {
  final _formKey = GlobalKey<FormState>();
  final SentOtpController sentOtpController =
  Get.put(SentOtpController());
  final _sendTextController = TextEditingController();
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
              decoration: const BoxDecoration(color: AppConstant.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('asset/json/playstation.json',
                      width: 150,
                      height: 150,
                      animate: true,
                      fit: BoxFit.cover,
                      repeat: true),
                  const SizedBox(
                    height: 110,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width * 0.85,
                            height: 80,
                            child: CustomTextField(
                              controller: _sendTextController,
                              prefixIcon: Icon(Icons.phone_android_sharp),
                              hintText: "      enter number",
                            ),
                          ),
                          SizedBox(
                            child: CustomElevatedBtn(
                              height: 40,
                              backgroundColor: AppConstant.appBtnColor,
                              foregroundColor: AppConstant.appMainColor,
                              title: "GET OTP",
                              onPressed: () {
                                sentOtpController.sendOtp(_sendTextController.text);
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
      ),
    );
  }
}
