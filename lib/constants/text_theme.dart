import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoicer/constants/colors.dart';

class MyTextTheme{
  static TextStyle splashHeadline = TextStyle(
    fontFamily: GoogleFonts.robotoMono().fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
    color: bodyTextColor,
  );

  static TextStyle ButtonText = TextStyle(
    fontFamily: GoogleFonts.sourceCodePro().fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.60,
    color: Colors.white,
  );

   static TextStyle heading = TextStyle(
    fontFamily: GoogleFonts.sourceCodePro().fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.60,
    color: themeBlue,
  );
    static TextStyle bodyHead = TextStyle(
    fontFamily: GoogleFonts.robotoMono().fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
    color: themeBlue.withOpacity(0.9),
  );
  static TextStyle bodyText = TextStyle(
    fontFamily: GoogleFonts.sourceCodePro().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
    color: themeBlue.withOpacity(0.9),
  );

 static TextStyle headingUbuntu = TextStyle(
    fontFamily: GoogleFonts.robotoMono().fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: -2,
    color: Colors.black,
 );
}