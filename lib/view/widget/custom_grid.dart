import 'package:flutter/material.dart';
import 'package:game_stop_spectrum/view/widget/custom_grid_item.dart';
class CustomGrid extends StatefulWidget {
  const CustomGrid({super.key});

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {

        return const CustomGridItem(itemWidth: 100, itemHeight: 100);
      },
    );
  }
}
