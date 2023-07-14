
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_theme.dart';

class SalesInfoContainer extends StatelessWidget {
  final String overview;

   const SalesInfoContainer({
    super.key,
    required this.overview,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.42,
      height: height*0.12,
      decoration: BoxDecoration(
        color: themeCream,
        border: Border.all(
          color: themeOrangePrimary,
          width: 1.5,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(overview,style: MyTextTheme.bodyHead.copyWith(fontSize: 16),),
            const SizedBox(height: 5,),
            Text("Rs. 1,00,000",style: MyTextTheme.bodyHead.copyWith(color: Color.fromARGB(255, 33, 103, 46)),),
            

          ],
        ),
      ),
    );
  }
}