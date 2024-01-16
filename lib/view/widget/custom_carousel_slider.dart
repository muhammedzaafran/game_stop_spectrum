import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<Widget> items;

  CustomCarouselSlider({required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: 200.0,
        // Adjust the height as needed
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
        onPageChanged: (index, reason) {
          // Handle page change
        },
      ),
    );
  }
}

class MyCarouselItem extends StatelessWidget {
  final String imageUrl;

  MyCarouselItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Example of using CustomCarouselSlider
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> carouselItems = [
      MyCarouselItem(imageUrl: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.cnet.com%2Fa%2Fimg%2Fresize%2Fea66ddc9276eef2884da221adc70ed1cf1545951%2Fhub%2F2021%2F10%2F16%2F11804578-0dbc-42af-bcd1-3bc7b1394962%2Fthe-batman-2022-teaser-poster-batman-01-promo.jpg%3Fauto%3Dwebp%26fit%3Dcrop%26height%3D675%26width%3D1200&tbnid=64hcC8n54Z6e5M&vet=12ahUKEwj_joj4quGDAxWn9qACHSG1ByIQMygEegQIARB7..i&imgrefurl=https%3A%2F%2Fwww.cnet.com%2Fculture%2Fentertainment%2Fthe-batman-reveals-its-epic-runtime-with-and-without-credits%2F&docid=dqVyibqkz69wJM&w=1200&h=675&q=batman&client=opera-gx&ved=2ahUKEwj_joj4quGDAxWn9qACHSG1ByIQMygEegQIARB7'),
      MyCarouselItem(imageUrl: 'https://example.com/image2.jpg'),
      MyCarouselItem(imageUrl: 'https://example.com/image3.jpg'),
      // Add more items as needed
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  const Text('Custom Carousel Slider'),
        ),
        body: CustomCarouselSlider(items: carouselItems),
      ),
    );
  }
}
