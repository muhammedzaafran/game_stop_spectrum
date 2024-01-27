import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../Screens/product_details_page.dart';
import '../../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Get.to(() => ProductDetailsScreen(productModel: productModel));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: productModel.productImage[0],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150, // Set a fixed height
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "${productModel.productName}",
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25,fontFamily: 'BebasNeue-Regular'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 17),

                  // Price
                  Container(
                    height: 20, // Set a fixed height
                    child: Text("₹${productModel.price}",style: TextStyle(fontFamily: 'BebasNeue-Regular',fontSize: 25,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 17),

                  // Description
                  Container(
                    height: 40, // Set a fixed height
                    child: Text(
                      "${productModel.productDescription}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
