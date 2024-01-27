import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:game_stop_spectrum/model/order_model.dart';
import 'package:game_stop_spectrum/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:game_stop_spectrum/view/home_page.dart';

import '../services/random_id_generator/generate_order_id_service.dart';

class PlaceOrderController extends GetxController {
  void placeOrder({
    required BuildContext context,
    required String customerName,
    required String customerPhone,
    required String customerAddress,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    EasyLoading.show(status: "Please Wait...");
    if (user != null) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('cart')
            .doc(user.uid)
            .collection('cartOrders')
            .get();

        List<QueryDocumentSnapshot> documents = querySnapshot.docs;

        for (var doc in documents) {
          Map<String, dynamic>? data =
              doc.data() as Map<String, dynamic>?; // Added null check

          String orderId = generateOrderId();

          if (data != null) {
            OrderModel orderModel = OrderModel(
              productId: data['productId'],
              categoryId: data['categoryId'],
              productName: data['productName'],
              categoryName: data['categoryName'],
              price: data['price'],
              productImage: data['productImage'],
              productDescription: data['productDescription'],
              createdAt: DateTime.now(),
              updatedAt: data['updatedAt'],
              productQuantity: data['productQuantity'],
              productTotalPrice: data['productTotalPrice'].toDouble(),
              customerId: user.uid,
              customerName: customerName,
              customerPhone: customerPhone,
              customerAddress: customerAddress,
              consoleType: data['consoleType'],
            );

            // Moved this block outside the loop
            await FirebaseFirestore.instance
                .collection('orders')
                .doc(user.uid)
                .collection('confirmOrders')
                .doc(orderId)
                .set(orderModel.toMap());

            // Added await for consistency
            await FirebaseFirestore.instance
                .collection('cart')
                .doc(user.uid)
                .collection('cartOrders')
                .doc(orderModel.productId)
                .delete();

            print('Deleted cart product: ${orderModel.productId}');
          }
        }

        // Moved this block outside the loop
        await FirebaseFirestore.instance.collection('orders').doc(user.uid).set(
          {
            'uId': user.uid,
            'customerName': customerName,
            'customerPhone': customerPhone,
            'customerAddress': customerAddress,
            'orderStatus': false,
            'createdAt': DateTime.now(),
          },
        );

        print("Order Confirmed");
        Get.snackbar(
          "Order Confirmed",
          "Thank you for your order!",
          backgroundColor: AppConstant.appMainColor,
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );

        EasyLoading.dismiss();
        Get.offAll(() => const HomePage());
      } catch (e) {
        print("Error: $e");
      }
    }
  }
}
