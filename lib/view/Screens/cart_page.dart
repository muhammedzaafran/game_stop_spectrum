import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import '../../controller/cart-price-controller.dart';
import '../../model/cart_model.dart';
import '../../utils/app_constant.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController _productPriceController =
      Get.put(ProductPriceController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstant.black,
      appBar: AppBar(
        title: const Text(
          "C A R T",
          style: TextStyle(
              fontFamily: 'BebasNeue-Regular',
              fontSize: 30,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppConstant.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(20), // Adjust the radius as needed
        ),
        margin: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Obx(
                () => Text(
                  " Total ₹ : ${_productPriceController.totalPrice.value.toStringAsFixed(1)} rs",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your WhatsApp share logic here
                },
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.black),
                  overlayColor: MaterialStateProperty.all(Colors.teal),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.check, color: Color(0xFFFF0000)),
                    ),
                    SizedBox(width: 8),
                    Text("Checkout", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('cart')
                    .doc(user!.uid)
                    .collection('cartOrders')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: Get.height / 5,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No products found!"),
                    );
                  }

                  if (snapshot.data != null) {
                    return Container(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final productData = snapshot.data!.docs[index];
                          CartModel cartModel = CartModel(
                            productId: productData['productId'],
                            categoryId: productData['categoryId'],
                            productName: productData['productName'],
                            categoryName: productData['categoryName'],
                            price: productData['price'],
                            productImage: productData['productImage'],
                            productDescription:
                                productData['productDescription'],
                            createdAt: productData['createdAt'],
                            updatedAt: productData['updatedAt'],
                            productQuantity: productData['productQuantity'],
                            productTotalPrice: productData['productTotalPrice'],
                            consoleType: productData['consoleType'],
                          );

                          //calculate price
                          // _productPriceController.fetchProductPrice();
                          return SwipeActionCell(
                            key: ObjectKey(cartModel.productId),
                            trailingActions: [
                              SwipeAction(
                                title: "Delete",
                                forceAlignmentToBoundary: true,
                                performsFirstActionWithFullSwipe: true,
                                onTap: (CompletionHandler handler) async {
                                  print('deleted');

                                  await FirebaseFirestore.instance
                                      .collection('cart')
                                      .doc(user!.uid)
                                      .collection('cartOrders')
                                      .doc(cartModel.productId)
                                      .delete();
                                },
                              )
                            ],
                            child: Card(
                              elevation: 5,
                              color: AppConstant.appTextColor,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: AppConstant.appMainColor,
                                  backgroundImage:
                                      NetworkImage(cartModel.productImage[0]),
                                ),
                                title: Text(cartModel.productName),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        "Price : ${cartModel.productTotalPrice.toString()}"),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            if (cartModel.productQuantity > 1) {
                                              await FirebaseFirestore.instance
                                                  .collection('cart')
                                                  .doc(user!.uid)
                                                  .collection('cartOrders')
                                                  .doc(cartModel.productId)
                                                  .update({
                                                'productQuantity':
                                                    cartModel.productQuantity -
                                                        1,
                                                'productTotalPrice': (double
                                                        .parse(
                                                            cartModel.price) *
                                                    (cartModel.productQuantity -
                                                        1))
                                              });
                                            }
                                          },
                                          child: const CircleAvatar(
                                            radius: 14.0,
                                            backgroundColor:
                                                AppConstant.appMainColor,
                                            child: Text('-'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 20.0,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            if (cartModel.productQuantity > 0) {
                                              await FirebaseFirestore.instance
                                                  .collection('cart')
                                                  .doc(user!.uid)
                                                  .collection('cartOrders')
                                                  .doc(cartModel.productId)
                                                  .update({
                                                'productQuantity':
                                                    cartModel.productQuantity +
                                                        1,
                                                'productTotalPrice': double
                                                        .parse(
                                                            cartModel.price) +
                                                    double.parse(
                                                            cartModel.price) *
                                                        (cartModel
                                                            .productQuantity)
                                              });
                                            }
                                          },
                                          child: const CircleAvatar(
                                            radius: 14.0,
                                            backgroundColor:
                                                AppConstant.appMainColor,
                                            child: Text('+'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        "Quantity : ${cartModel.productQuantity}")
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
