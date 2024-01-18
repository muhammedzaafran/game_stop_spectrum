import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';// Replace with the correct import path

class YourWidget extends StatelessWidget {
  final String uId; // Assuming uId is defined somewhere in your widget

  YourWidget({required this.uId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').where('uId', isEqualTo: uId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Data has been loaded successfully
          List<QueryDocumentSnapshot> data = snapshot.data!.docs;
          int dataLength = data.length;
          return ListView.builder(
            itemCount: dataLength,
            itemBuilder: (context, index) {
              final userData = data[index].data() as Map<String, dynamic>;
              var user = UserModel.fromMap(userData);

              // You can now use 'user' to display your UI components
              return ListTile(
                title: Text(user.username),
                subtitle: Text(user.email),
                // Add other UI components as needed
              );
            },
          );
        }
      },
    );
  }
}
