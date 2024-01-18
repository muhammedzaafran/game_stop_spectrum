import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/user_model.dart';
import '../utils/app_constant.dart';// Replace with the correct import path

class DrawerHeadTile extends StatelessWidget {
  final String uId; // Assuming uId is defined somewhere in your widget

  DrawerHeadTile({required this.uId});

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
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    "${user.username}",
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontFamily: 'Roboto-Regular',
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    "${user.email}",
                    style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontFamily: 'Roboto-Regular',
                        fontSize: 10.sp),
                  ),
                  leading: CircleAvatar(
                      radius: 22.0,
                      backgroundColor: AppConstant.appMainColor,
                      child: Image.network("${user.userImg}")),
                ),
              );
            },
          );
        }
      },
    );
  }
}
