import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/home_page.dart';
import 'package:game_stop_spectrum/view/test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/app_constant.dart';
class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(20.0).r,
          bottomRight: const Radius.circular(20.0).r,
        ),
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
          DrawerHeadTile(uId: user!.uid),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            thickness: 1.5,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Home",
                style: TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(
                Icons.home,
                color: AppConstant.appTextColor,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: AppConstant.appTextColor,
              ),
              onTap: () {

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Message",
                style: TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(
                Icons.message,
                color: AppConstant.appTextColor,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: AppConstant.appTextColor,
              ),
              onTap: () {

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Orders",
                style: TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(
                Icons.shopping_bag,
                color: AppConstant.appTextColor,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: AppConstant.appTextColor,
              ),
              onTap: () {

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Contact",
                style: TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(
                Icons.help,
                color: AppConstant.appTextColor,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: AppConstant.appTextColor,
              ),
              onTap: () {

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              onTap: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                FirebaseAuth _auth = FirebaseAuth.instance;
                await _auth.signOut();
                await googleSignIn.signOut();
                Get.offAll(() => HomePage());
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Logout",
                style: TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(
                Icons.logout,
                color: AppConstant.appTextColor,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: AppConstant.appTextColor,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppConstant.transparent,
    );
  }
}
