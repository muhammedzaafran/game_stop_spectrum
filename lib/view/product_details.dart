import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final CarouselController carouselController = CarouselController();

  @override
  // Load favorite status from SharedPreferences

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size halfwidth = MediaQuery.of(context).size / 2;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            width: size.width,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, size: 25, color: Colors.black),
                ),
                onChanged: (value) {},
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.black), // Add to Cart icon
              onPressed: () {
                // Navigate to the CartScreen
              },
            ),
          ],
        ),
        body: const SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.99, 0),
          ),
          Align(
            alignment: Alignment(-0.99, 0),
            child: Padding(
              padding: EdgeInsets.all(4.0),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star_half,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star_border,
                color: Colors.orangeAccent,
              ),
            ],
          )
        ])));
  }
}
