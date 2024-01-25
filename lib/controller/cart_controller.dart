import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/cart_model.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> checkProductExistence(
      {required String uId,
      int quantityIncrement = 1,
      required ProductModel productModel}) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      double totalPrice = double.parse(productModel.price) * updatedQuantity;

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });
      Get.showSnackbar(
        const GetSnackBar(
          messageText: Text("Updated Quantity", style: TextStyle(
            color: Colors.black,fontFamily: 'Roboto-Bold'
          ),),
          titleText: Text(
            "Product Exists",
            style: TextStyle(color: Colors.black,fontFamily: 'Roboto-Bold'),
          ),
          backgroundColor: Colors.greenAccent,
          icon: Icon(
            Icons.cancel_presentation_rounded,
            color: Colors.black,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );

      CartModel cartModel = CartModel(
        productId: productModel.productId,
        categoryId: productModel.categoryId,
        productName: productModel.productName,
        categoryName: productModel.categoryName,
        price: productModel.price,
        productImage: productModel.productImage,
        productDescription: productModel.productDescription,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        productQuantity: 1,
        consoleType: productModel.consoleType,
        productTotalPrice: double.parse(productModel.price),
      );

      await documentReference.set(cartModel.toMap());

      print("product added");
      Get.showSnackbar(
        const GetSnackBar(
          title: "Success",
          message: 'Product Added',
          backgroundColor: Colors.greenAccent,
          icon: Icon(
            Icons.add,
            color: Colors.black,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
