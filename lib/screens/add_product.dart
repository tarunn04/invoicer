import 'package:flutter/material.dart';
import 'package:invoicer/constants/colors.dart';
import 'package:invoicer/constants/text_theme.dart';

import '../widget/custom_form_field.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Add Products",style: MyTextTheme.bodyHead.copyWith(fontSize: 22)),
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_ios),
        )
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(width: width, height: height,textBody: "Enter Product Name",textHead: "Product Name",),
                const SizedBox(height: 10,),
                CustomFormField(width: width, height: height,textBody: "Enter Product Category",textHead: "Product Category",),
                const SizedBox(height: 10,),

                Row(
                  children: [
                    CustomFormField(width: width*0.3, height: height,textBody: "l",textHead: "Length",),
                    SizedBox(width: width*0.05,),
                    CustomFormField(width: width*0.3, height: height,textBody: "w",textHead: "Width",),
                    SizedBox(width: width*0.05,),
                    CustomFormField(width: width*0.3, height: height,textBody: "b",textHead: "Breadth",),
                  ],
                ),
                
                const SizedBox(height: 10,),

                Row(
                  children: [
                    CustomFormField(width: width*0.45, height: height,textBody: "Price",textHead: "Cost Price",),
                    SizedBox(width: width*0.05,),
                    CustomFormField(width: width*0.45, height: height,textBody: "Price",textHead: "Market Price",),
                  ],
                ),

  
                const SizedBox(height: 10,),
                SizedBox(height: height *0.3,),
                
                Center(
                  child: SizedBox(
                    width: width*0.4,
                    height: height*0.065,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
          
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                          )
                          
                        )
                      ),
                      child:  Text("Add Product",style: MyTextTheme.bodyText.copyWith(fontSize: 16),),
                    ),
                  ),
                )
              ],
          ),
        )
      ),
    );
  } 
}
