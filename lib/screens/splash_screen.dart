import 'package:flutter/material.dart';
import 'package:invoicer/constants/colors.dart';
import 'package:invoicer/constants/text_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/cover_img.jpg",fit: BoxFit.cover,),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: height*0.35,
              width: 100,
              child: Column(
                children: [
                  Text("INVOICE",style: MyTextTheme.splashHeadline.copyWith(height: 1.2),),
                  Text("BILLING",style: MyTextTheme.splashHeadline.copyWith(height: 1.2),),
                  Text("ANALYTICS",style: MyTextTheme.splashHeadline.copyWith(height: 1.2),),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: 60,
                      width: width*0.5,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        border: Border.all(color: buttonColor),
                      ),
                  
                      child: Center(
                        child: Text(
                          "Get Started",style: MyTextTheme.ButtonText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            ),
        ],
      )
    );
  }
}