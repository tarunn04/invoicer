
import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class CustomFormField extends StatelessWidget {
  final String textBody;
  final String textHead;
  const CustomFormField({
    super.key,
    required this.width,
    required this.height, required this.textBody, required this.textHead,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textHead,style: MyTextTheme.bodyText),
        const SizedBox(height: 5,),
        SizedBox(
          width: width*0.9,
          height: height*0.065,
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: textBody,
              hintStyle: MyTextTheme.bodyText.copyWith(color: Color.fromARGB(255, 88, 88, 88),fontSize: 16),
              border:const  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                )
              ),
              focusedBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}