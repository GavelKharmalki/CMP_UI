import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/item_model.dart';

class CategoriesItem extends StatelessWidget {
  CategoriesItem({Key? key}) : super(key: key);

  final List<ItemModel> items = [
    ItemModel(name: 'Starters', imagePath: 'assets/image 36.png'),
    ItemModel(name: 'Drinks', imagePath: 'assets/cocktail-377960_1280 1.png'),
    ItemModel(name: 'Rice', imagePath: 'assets/image 29.png'),
    ItemModel(name: 'Curry', imagePath: 'assets/21251374_6316253.png'),
    ItemModel(
        name: 'Desserts',
        imagePath: 'assets/46c02ca9450f5063c6904559424b2f02.png'),
    ItemModel(
        name: 'Starters',
        imagePath: 'assets/e3e0fef6f2e90b699c52935263fd3f56.png'),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rescale(context, 90),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          EdgeInsets padding;
          if (index == 0) {
            padding = EdgeInsets.only(left: 24.0);
          } else {
            padding = EdgeInsets.only(left: 10.0);
          }
          return Column(
            children: [
              Padding(
                padding: padding,
                child: Container(
                  width: rescale(context, 70),
                  height: rescale(context, 70),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(items[index].imagePath),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  items[index].name,
                  style: GoogleFonts.lexend(
                      fontSize: rescale(context, 12),
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
