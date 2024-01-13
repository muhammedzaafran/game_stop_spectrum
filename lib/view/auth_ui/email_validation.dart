import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailValidationScreen extends StatefulWidget {
  final User user;
  const EmailValidationScreen({super.key, required this.user});

  @override
  State<EmailValidationScreen> createState() => _EmailValidationScreenState();
}

class _EmailValidationScreenState extends State<EmailValidationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
