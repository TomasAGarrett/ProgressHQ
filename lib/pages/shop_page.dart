import 'package:flutter/material.dart';

/*

S H O P P A G E

This is the ShopPage.
Currently it is just showing a grid of boxes.

This page should be populated with products and services 
that the user can buy $

*/

class HeatmapPage extends StatelessWidget {
  HeatmapPage({Key? key}) : super(key: key);

  final List<int> data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: _getColor(data[index]),
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getColor(int count) {
    if (count == 0) {
      return Colors.white;
    } else if (count < 3) {
      return Colors.blue[100]!;
    } else if (count < 6) {
      return Colors.blue[300]!;
    } else if (count < 9) {
      return Colors.blue[500]!;
    } else {
      return Colors.blue[700]!;
    }
  }
}
