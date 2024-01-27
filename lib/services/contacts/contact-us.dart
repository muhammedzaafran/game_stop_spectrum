import 'package:flutter/material.dart';

class ContactUsDialog {
  static void showContactUsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          title: const Text("Contact Us",style: TextStyle(
            fontFamily: 'BebasNeue-Regular',
            fontWeight: FontWeight.normal,
            color: Colors.greenAccent,
            fontSize: 25
          ),),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text("For any inquiries or assistance, please contact us:",style: TextStyle(
                fontFamily: 'Roboto-Bold',color: Colors.white
              ),),
              SizedBox(height: 20),
              Text("Email: support@spectrum.net.in",style: TextStyle(
                  fontFamily: 'Roboto-Bold',color: Colors.white)),
              Text("Phone: +0484 408 2000",style: TextStyle(
                  fontFamily: 'Roboto-Bold',color: Colors.white)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Close",style: TextStyle(color: Colors.greenAccent,fontSize: 15,fontFamily: 'Roboto-Bold')),
            ),
          ],
        );
      },
    );
  }
}