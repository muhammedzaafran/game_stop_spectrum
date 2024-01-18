import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:game_stop_spectrum/view/auth_ui/onboarding_screen.dart';
import 'package:game_stop_spectrum/view/widget/custom-drawer-widget.dart';
import '../utils/app_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        drawer:DrawerWidget(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
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
            children: [
              const SizedBox(
                height: 80,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 200.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: const TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
