import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:game_stop_spectrum/services/upi/upi_india.dart';
import 'package:get/get.dart';
import 'package:upi_india/upi_india.dart';
import '../../controller/cart-price-controller.dart';
import '../../controller/place_order_controller.dart';
import '../../model/cart_model.dart';
import '../../services/validator/validator.dart';
import '../../utils/app_constant.dart';
import '../widget/custom_buttons.dart';
import '../widget/custom_textfield.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _sendTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController _productPriceController =
      Get.put(ProductPriceController());
  final PlaceOrderController _placeOrderController =
      Get.put(PlaceOrderController());
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void showCustomBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.9,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Colors.teal,
              Colors.black
            ], // Change these colors as needed
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Container(
                    height: 55.0,
                    child: CustomTextField(
                        keyboardType: TextInputType.name,
                        validateInput: (value) => Validator.validateName(
                              name: value,
                            ),
                        prefixIcon: const Icon(
                          Icons.account_box_outlined,
                          color: Colors.black,
                        ),
                        controller: nameController,
                        hintText: "Name",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 16.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: SizedBox(
                    height: 55.0,
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      validateInput: (value) =>
                          Validator.validatePhoneNumber(phoneNumber: value),
                      controller: phoneController,
                      prefixIcon: const Icon(
                        Icons.phone_android_sharp,
                        color: Colors.black,
                      ),
                      hintText: "Phone",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Container(
                    height: 55.0,
                    child: CustomTextField(
                        keyboardType: TextInputType.name,
                        validateInput: (value) => Validator.validateAddress(
                              address: value,
                            ),
                        prefixIcon: const Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        controller: addressController,
                        hintText: "Address",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 16.0)),
                  ),
                ),
                CustomElevatedBtn(
                  height: 40,
                  backgroundColor: AppConstant.appMainColor,
                  foregroundColor: AppConstant.appBtnColor,
                  title: "Place Order",
                  fontFamily: 'Roboto-Bold',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (nameController.text != '' &&
                          phoneController.text != '' &&
                          addressController.text != '') {
                        String name = nameController.text.trim();
                        String phone = phoneController.text.trim();
                        String address = addressController.text.trim();
                        if (_productPriceController.totalPrice.value > 0) {
                          Get.to(() => UpiScreen(
                              name: name,
                              phone: phone,
                              address: address,
                              totalAmount: _productPriceController
                                  .totalPrice.value
                                  .toString()));
                        } else {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: "'Empty Cart",
                              message:
                                  'Your cart is empty. Add some items to proceed to checkout.',
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
                  },
                  textColor: Colors.white,
                  width: Get.width * 0.30,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      elevation: 6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstant.black,
      appBar: AppBar(
        title: const Text(
          "CART",
          style: TextStyle(
              fontFamily: 'BebasNeue-Regular',
              fontSize: 35,
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
              padding: const EdgeInsets.all(18.0),
              child: Obx(
                () => Text(
                  " Total ₹ : ${_productPriceController.totalPrice.value.toStringAsFixed(1)} rs",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  showCustomBottomSheet();
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
                  return const Center(
                    child: Text("Error"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: Get.height / 5,
                    child: const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No products found!"),
                  );
                }

                if (snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final productData = snapshot.data!.docs[index];
                      CartModel cartModel = CartModel(
                        productId: productData['productId'],
                        categoryId: productData['categoryId'],
                        productName: productData['productName'],
                        categoryName: productData['categoryName'],
                        price: productData['price'],
                        productImage: productData['productImage'],
                        productDescription: productData['productDescription'],
                        createdAt: productData['createdAt'],
                        updatedAt: productData['updatedAt'],
                        productQuantity: productData['productQuantity'],
                        productTotalPrice: productData['productTotalPrice'],
                        consoleType: productData['consoleType'],
                      );

                      //calculate price
                      _productPriceController.fetchProductPrice();
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                cartModel.productQuantity - 1,
                                            'productTotalPrice':
                                                (double.parse(cartModel.price) *
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
                                                cartModel.productQuantity + 1,
                                            'productTotalPrice': double.parse(
                                                    cartModel.price) +
                                                double.parse(cartModel.price) *
                                                    (cartModel.productQuantity)
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
                                Text("Quantity : ${cartModel.productQuantity}")
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
