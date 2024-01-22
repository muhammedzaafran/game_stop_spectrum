import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_stop_spectrum/utils/app_constant.dart';
import 'package:get/get.dart';

import '../../controller/banner_controller.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentindex = 0;
  final CarouselController carouselController = CarouselController();
  final BannerController _bannerController = Get.put(BannerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstant.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Product detail page",
            style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontFamily: 'BebasNeue-Regular'),
          ),
          backgroundColor: AppConstant.transparent,
          elevation: 0,
        ),
        body: Container(
            child: Column(
              children: [
                Obx(() {
                  return CarouselSlider(
                    items: _bannerController.bannerUrls
                        .map(
                          (imageUrls) => ClipRRect(
                        borderRadius: BorderRadius.circular(10.0).r,
                        child: CachedNetworkImage(
                          imageUrl: imageUrls,
                          fit: BoxFit.cover,
                          width: Get.width - 10.w,
                          placeholder: (context, url) => const ColoredBox(
                            color: Colors.white,
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    )
                        .toList(),
                    options: CarouselOptions(
                      height: 400, // Set your desired height
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      pauseAutoPlayOnTouch: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _bannerController.bannerUrls
                      .asMap()
                      .entries
                      .map(
                        (entry) => GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentindex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentindex == entry.key
                              ? Colors.teal
                              : Colors.white,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ],
            )),
      ),
    );
  }
}
