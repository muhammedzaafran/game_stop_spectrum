import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/auth_ui/onboarding_screen.dart';
import 'package:game_stop_spectrum/view/widget/banner_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import '../controller/get_user_data_controller.dart';
import '../controller/google_sign_in_controller.dart';
import '../utils/app_constant.dart';
import 'home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  // int _currentSelectedIndex = 0;
  // var titles = ["Home", "Favorites", "Cart", "Settings"];
  // final List<Widget> _pages = [
  //   const HomePage(),
  //   const Favorites(),
  //   const CartScreen(),
  //   const Settings1(),
  // ];

  final _advancedDrawerController = AdvancedDrawerController();
  final GoogleSignInController googleSignInController =
      GoogleSignInController();
  final GetUserDataController _getUserDataController =
      Get.put(GetUserDataController());
  User? user = FirebaseAuth.instance.currentUser;
  late List<QueryDocumentSnapshot<Object?>> userData = [];

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
  }

  _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return AdvancedDrawer(
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.teal.withOpacity(0.2)],
              ),
            ),
          ),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          childDecoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: SafeArea(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
                      future: _getUserDataController.getUserData(user!.uid),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Return a loading indicator or placeholder widget
                          return SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const Center(
                                  child: CupertinoActivityIndicator()));
                        } else if (snapshot.hasError) {
                          // Handle error
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // Data has been loaded successfully
                          List<QueryDocumentSnapshot<Object?>> data =
                              snapshot.data!;

                          // Rest of your widget tree using the 'data'

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: ListTile(
                              titleAlignment: ListTileTitleAlignment.center,
                              title: Text(
                                "${data.isNotEmpty ? data[0]['username'] : 'N/A'}",
                                style: TextStyle(
                                  color: AppConstant.appTextColor,
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 15.sp,
                                ),
                              ),
                              subtitle: Text(
                                "${data.isNotEmpty ? data[0]['email'] : 'N/A'}",
                                style: TextStyle(
                                    color: AppConstant.appTextColor,
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 10.sp),
                              ),
                              leading: CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor: AppConstant.appMainColor,
                                  child:
                                      Image.network("${data[0]['userImg']}")),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }),
                        (route) => false,
                      );
                    },
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.account_box),
                    title: const Text('Profile'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.favorite),
                    title: const Text('Favourites'),
                  ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(() => const OnboardingScreen());
                    },
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text(
                        'Terms of Service | Privacy Policy',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Scaffold(
            backgroundColor: AppConstant.black,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "GET YOUR GAMES HERE ",
                style: TextStyle(fontFamily: 'BebasNeue-Regular', fontSize: 35),
              ),
              backgroundColor: AppConstant.transparent,
              elevation: 0,
            ),
            body: Column(
              children: [BannerWidget()],
            ),
          ),
        );
      },
    );
  }
}
