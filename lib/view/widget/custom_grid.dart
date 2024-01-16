// import 'package:flutter/material.dart';
//
// import 'custom_grid_item.dart';
//
// class ProductItem {
//   final String title;
//   final String imageUrl;
//   final double price;
//
//   ProductItem({
//     required this.title,
//     required this.imageUrl,
//     required this.price,
//   });
// }
//
// class CustomGridView extends StatelessWidget {
//   final List<ProductItem> products;
//   final Function(ProductItem)? onProductSelected;
//
//   const CustomGridView({
//     Key? key,
//     required this.products,
//     this.onProductSelected,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8.0,
//         mainAxisSpacing: 8.0,
//       ),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//
//         return ProductGridItem(
//           title: product.title,
//           imageUrl: product.imageUrl,
//           price: product.price,
//           onPressed: () {
//             if (onProductSelected != null) {
//               onProductSelected!(product);
//             }
//           },
//         );
//       },
//     );
//   }
// }
//
