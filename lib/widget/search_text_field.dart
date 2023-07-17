import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoicer/constants/colors.dart';

class SearchTextField extends StatelessWidget {
  Function(String) onChanged;
  TextEditingController controller;
  SearchTextField({super.key, required this.onChanged,required this.controller});

  @override
  Widget build(BuildContext context) {
    var widget = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: widget * 0.9,
      decoration: BoxDecoration(
        // color: themeCream,
        border: Border.all(
          color: Color.fromARGB(112, 0, 0, 0),
          width: 1.5,
        )
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: const Color.fromARGB(255, 147, 146, 146),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Search Products',
          hintStyle:TextStyle(
            fontFamily: GoogleFonts.sourceCodePro().fontFamily,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: const Icon(CupertinoIcons.search),
        ),
      ),
    );
  }
}
