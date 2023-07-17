import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:invoicer/constants/colors.dart';
import 'package:invoicer/constants/text_theme.dart';
import 'package:invoicer/controller/product_controller.dart';

import '../widget/custom_form_field.dart';
import '../widget/custom_search_box.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Edit Product",style: MyTextTheme.bodyHead.copyWith(fontSize: 22)),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        )
      ),
      body: Form(
        key: _productController.ProductformKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 10,),
                SizedBox(height: height *0.1,),
                
                Center(
                  child: SizedBox(
                    width: width*0.4,
                    height: height*0.065,
                    child: ElevatedButton(
                      onPressed: (){
                      },
                      style: ElevatedButton.styleFrom(
          
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                          )
                          
                        )
                      ),
                      child:  Text("Edit Product",style: MyTextTheme.bodyText.copyWith(fontSize: 16),),
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
