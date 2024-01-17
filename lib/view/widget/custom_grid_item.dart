import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGridItem extends StatefulWidget {
  final double itemHeight, itemWidth;
  final VoidCallback? onPressed;

  const CustomGridItem({
    required this.itemWidth,
    required this.itemHeight,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CustomGridItem> createState() => _CustomGridItemState();
}

class _CustomGridItemState extends State<CustomGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          width: widget.itemWidth,
          height: widget.itemHeight,
          child: Column(
            children: [
              SizedBox(
                width: widget.itemWidth, // Adjust as needed
                height: widget.itemHeight * 0.7, // Adjust as needed
                child: CachedNetworkImage(
                  imageUrl: "https://firebasestorage.googleapis.com/v0/b/game-stop-spectrum.appspot.com/o/marcin-lukasik-uYpOYyJdhRE-unsplash.jpg?alt=media&token=6ccf4a15-03f4-420e-8388-f926a325ecc7",
                  placeholder: (context, url) => const ColoredBox(
                    color: Colors.white,
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
