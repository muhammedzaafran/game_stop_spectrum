import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(color: AppConstant.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('asset/json/playstation.json',
                      width: 100,
                      height: 100,
                      animate: true,
                      fit: BoxFit.cover,
                      repeat: true),
                  const SizedBox(
                    height: 30,
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
                            child: const CustomTextField(
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
                              onPressed: () {},
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
