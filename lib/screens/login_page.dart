import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/text_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              height: height*0.3,
              width: width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border:BorderDirectional(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2
                  )
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Text("Sign in",style: MyTextTheme.headingUbuntu),
                  Text("Your Account",style: MyTextTheme.headingUbuntu),
                ],
              ),
            ),
            
            const SizedBox(height: 10,),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone Verification",style: MyTextTheme.bodyHead.copyWith(
                      color: const Color.fromARGB(255, 36, 36, 36),
                      fontSize: 24
                    ),),
                  
            
                  SizedBox(height: 5,),

                  SizedBox(
                    width: width*0.9,
                    child: Text("We need to verify before getting started!",style: MyTextTheme.bodyText.copyWith(
                      color:const Color.fromARGB(223, 36, 36, 36),
                      fontSize: 16
                    ),),
                  ),

                  const SizedBox(height: 20,),

                  Container(
                    width: width*0.9,
                    height: height*0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 9, 9),
                        width: 1,
                      )
                  
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width*0.15,
                          padding: const  EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            border: BorderDirectional(
                              end: BorderSide(
                                color:  Color.fromARGB(255, 9, 9, 9),
                                width: 1
                              )
                            )
                          
                          ),
                          child: Text("+91",style: MyTextTheme.bodyText.copyWith(
                            color: const Color.fromARGB(223, 36, 36, 36),
                            fontSize: 18
                          ),),
                        ),
                
                        Text("",style: MyTextTheme.bodyText.copyWith(
                          color: const Color.fromARGB(223, 36, 36, 36),
                          fontSize: 18
                          ),
                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: width*0.5,
                          child: TextField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            
                            decoration: InputDecoration(
                              
                              border: InputBorder.none,
                              hintText: "Enter Phone number",
                              hintStyle: MyTextTheme.bodyText.copyWith(
                                color: const Color.fromARGB(223, 36, 36, 36),
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                    ]),
                  ),
                  
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(onPressed: (){}, child: Text("Resend OTP",style: MyTextTheme.bodyText.copyWith(
                        color:const Color.fromARGB(255, 133, 30, 30),
                        fontSize: 16
                      ),),
                      ),
                    ],
                  ),

                 

                ],
              ),
            )
        ],
      ),
    );
  }
}