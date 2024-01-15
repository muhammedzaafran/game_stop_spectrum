import 'package:flutter/material.dart';
import 'package:game_stop_spectrum/view/widget/custom_buttons.dart';
import 'package:game_stop_spectrum/view/widget/custom_textfield.dart';

import '../../utils/app_constant.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({super.key});

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppConstant.black,
            appBar: AppBar(
              title: const Text("SEND OTP",
                  style:
                      TextStyle(fontSize: 35, fontFamily: 'BebasNeue-Regular')),
              centerTitle: true,
              backgroundColor: AppConstant.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 400,
                    height: 369,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          const SizedBox(
                            width: 600,
                            height: 80,
                            child: CustomTextField(
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
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            )));
  }
}
