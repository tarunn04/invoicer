
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/text_theme.dart';

class CustomFormField extends StatelessWidget {
  final String textBody;
  final String textHead;
  final TextEditingController controller;
  FormFieldValidator validator;
  final TextInputType type;

  CustomFormField({
    super.key,
    required this.width,
    required this.height, required this.textBody, 
    required this.textHead, required this.controller, 
    required this.validator, required this.type,
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
          height: height*0.070,
          child: TextFormField(
            validator:validator,
            controller: controller,
            cursorColor: Colors.black,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: textBody,
              hintStyle: MyTextTheme.bodyText.copyWith(color:const Color.fromARGB(255, 88, 88, 88),fontSize: 16),
              border:const  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(0)),

              ),
              focusedBorder:const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                borderSide: BorderSide(
                  color: Colors.black,
                )
              ),

              errorStyle: TextStyle(
                fontFamily: GoogleFonts.robotoMono().fontFamily,
                letterSpacing: -0.8,
                height:0.8,

              )
            ),
          ),
        ),
      ],
    );
  }
}