import 'package:craftmyplateui/screen/homescreen/custom_card.dart';
import 'package:flutter/material.dart';

import '../../model/starters_item_model.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Your other widgets go here
          Text("TESTING"),
          // ListView.builder for displaying CustomCard items
          Expanded(
            child: ListView.builder(
              itemCount: customCardData.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  text: customCardData[index].text,
                  imageUrl: customCardData[index].imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
