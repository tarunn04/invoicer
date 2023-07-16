
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class productViewContainer extends StatelessWidget {
  const productViewContainer({
    super.key,
    required this.height,
    required this.product,
  });

  final double height;
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product["productName"],
                  style: MyTextTheme.bodyHead.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  product["productCategory"],
                  style: MyTextTheme.bodyText,
                ),
                
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Market Price",style: MyTextTheme.bodyText.copyWith(fontSize: 14),),
                Text(
                  "₹ ${product["marketPrice"]}",
                  style: MyTextTheme.bodyHead.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
      
                Text(
                  "Stock: ${product["quantity"]}",
                  style: MyTextTheme.bodyHead.copyWith(
                      fontSize: 14,),
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
