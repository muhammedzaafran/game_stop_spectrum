import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient App Bar Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GET YOUR GAMES HERE",
          style: TextStyle(fontFamily: 'BebasNeue-Regular', fontSize: 35),
        ),
        backgroundColor: Colors.transparent, // Set to transparent
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.teal], // Your gradient colors
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Your main content goes here'),
      ),
    );
  }
}
