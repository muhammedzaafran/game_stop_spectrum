import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    backgroundColor: Colors.black,
    body: Column(
      children: [
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 360
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
