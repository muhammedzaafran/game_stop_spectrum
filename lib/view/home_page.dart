import 'package:flutter/material.dart';
import 'package:game_stop_spectrum/view/widget/custom_buttons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/google_sign_in_controller.dart';
import '../utils/app_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignInController _googleSignInController =
  Get.put(GoogleSignInController());
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomElevatedBtn(
                  height: 60,
                  backgroundColor: AppConstant.appBtnColor,
                  foregroundColor: AppConstant.appMainColor,
                  title: "Sign Out",
                  onPressed: () {
                    _googleSignInController.signOutGoogle();
                  },
                  textColor: Colors.white,
                  width: 357,
                ),
              ]),
        ),
      ),
    );
  }
}
