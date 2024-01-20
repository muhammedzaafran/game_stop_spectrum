import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppConstant.black,
            appBar: AppBar(
              backgroundColor: AppConstant.transparent,
              elevation: 0,
            )));
  }
}
