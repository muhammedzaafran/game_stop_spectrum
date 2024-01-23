import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/view/Screens/product_details_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/category_product_controller.dart';
import '../../model/product_model.dart';
import '../../utils/app_constant.dart';

class SingleCategoryProducts extends StatefulWidget {
  String categoryId;
  SingleCategoryProducts({super.key, required this.categoryId});

  @override
  State<SingleCategoryProducts> createState() => _SingleCategoryProductsState();
}

class _SingleCategoryProductsState extends State<SingleCategoryProducts> {
  final CategoryDataController _categoryDataController =
  Get.put(CategoryDataController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstant.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Category Products",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'BebasNeue-Regular',
            fontSize: 30
          ),

        ),
        backgroundColor: AppConstant.transparent,
        elevation: 0,
      ),
          body: Container(
            width: Get.width,
            height: Get.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
                  future: _categoryDataController.getCategoryProductData(widget.categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Return a loading indicator or placeholder widget
                      return SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child:
                          const Center(child: CircularProgressIndicator()));
                    } else if (snapshot.hasError) {
                      // Handle error
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Data has been loaded successfully
                      List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
                      int dataLength = data.length;

                      // Rest of your widget tree using the 'data'

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: dataLength,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.80,
                          ),
                          itemBuilder: (context, index) {
                            final productData = data[index];
                            ProductModel productModel = ProductModel(
                              productId: productData['productId'],
                              categoryId: productData['categoryId'],
                              productName: productData['productName'],
                              categoryName: productData['categoryName'],
                              productDescription: productData['productDescription'],
                              createdAt: productData['createdAt'],
                              updatedAt: productData['updatedAt'],
                              price: productData['price'],
                              productImage: productData['productImage'],
                              consoleType: productData['consoleType'],
                            );
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black26,
                                    width: 2.0.w,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.5),
                                        offset: const Offset(3, 2),
                                        blurRadius: 7.r)
                                  ]),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => ProductDetailsScreen(
                                          productModel: productModel));
                                    },
                                    child: SizedBox(
                                      width: 150.w,
                                      height: 150.h,
                                      child: Padding(
                                        padding: EdgeInsets.all(13.0.w),
                                        child: Image.network(
                                          productModel.productImage[0],
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${productModel.productName}",
                                      style: TextStyle(
                                          color: const Color(0xFF505050),
                                          fontFamily: 'Poppins',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 13.0.w),
                                          child: Text(
                                            ' ₹ ${productModel.price}',
                                            style: TextStyle(
                                                color:  Colors.black,
                                                fontFamily: 'Anton-Regular',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Flexible(
                                          child: CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor:
                                            const Color(0xFF000000),
                                            child: IconButton(
                                                icon: const Icon(
                                                    Icons.shopping_cart_outlined,
                                                    color: Color(0xFFFF0000)),
                                                onPressed: () async {}),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
    ));
  }
}
