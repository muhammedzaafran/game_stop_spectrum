import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          title: const Text("VERIFY YOUR EMAIL ADDRESS",
              style: TextStyle(fontSize: 35, fontFamily: 'BebasNeue-Regular')),
          centerTitle: true,
          backgroundColor: AppConstant.transparent,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('asset/json/verify.json',
                  width: 250, height: 150, animate: true, repeat: true),
              Container(
                width: Get.width * 0.5,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.white, width: 2.0), // Add border
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Name :  ${widget.user.displayName}",
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Email : ${widget.user.email}",
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  const Text(
                    "Email is not verified",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: CustomElevatedBtn(
                          height: 35,
                          backgroundColor: AppConstant.appBtnColor,
                          foregroundColor: AppConstant.appMainColor,
                          title: "Verify",
                          onPressed: () {
                            emailValidationController
                                .sendingEmailVerification(widget.user);
                          },
                          textColor: Colors.white,
                          width: Get.width * 0.20,
                        ),
                      ),
                      const SizedBox(width: 18,),
                      InkWell(
                        onTap: () async {
                          try {
                            User? user = await emailValidationController
                                .refreshEmail(widget.user);
                            if (user != null && user.emailVerified) {
                              Get.snackbar('Success : ',
                                  'Email has been verified successfully');
                              Get.off(const HomePage(),
                                  transition: Transition.leftToRightWithFade);
                            } else {
                              Get.snackbar('Failed : ',
                                  'Email has been not verified check your mail');
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
