import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstant.black,
      appBar: AppBar(
        title: const Text(
          "SETTINGS",
          style: TextStyle(
              fontFamily: 'BebasNeue-Regular',
              fontSize: 40,
              fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        backgroundColor: AppConstant.transparent,
        elevation: 0,
      ),
      body: const Column(
        children: [
          Text(
            "Accounts",
            style: TextStyle(color: Color(0xFFFF0000)),
          ),
        ],
      ),
    ));
  }
}
