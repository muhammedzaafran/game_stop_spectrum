import 'package:flutter/material.dart';
import 'package:game_stop_spectrum/view/widget/custom_grid.dart';
import 'package:game_stop_spectrum/view/widget/custom_grid_item.dart';
import 'package:get/get.dart';
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // List<ProductItem> products = [
  //   ProductItem(
  //     title: 'Product 1',
  //     imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  //     price: 19.99,
  //   ),
  //   ProductItem(
  //     title: 'Product 1',
  //     imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  //     price: 19.99,
  //   ),ProductItem(
  //     title: 'Product 1',
  //     imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  //     price: 19.99,
  //   ),
  //   ProductItem(
  //     title: 'Product 2',
  //     imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  //     price: 29.99,
  //   ),
  //   // Add more product items as needed
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Product Grid'),
      ),
      body:  CustomGridItem(itemWidth: Get.width*0.4, itemHeight: Get.width*0.4)
    );
  }
}
