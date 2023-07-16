import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:invoicer/constants/colors.dart';
import 'package:invoicer/constants/text_theme.dart';
import 'package:invoicer/controller/product_controller.dart';

import '../widget/custom_form_field.dart';
import '../widget/custom_search_box.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Add Products",style: MyTextTheme.bodyHead.copyWith(fontSize: 22)),
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


                CustomFormField(width: width, height: height,textBody: "Enter Product Name",textHead: "Product Name", controller: _productController.productNameController, 
                validator: (value) => _productController.validate(value, "Product Name"), type: TextInputType.text,),
                
                const SizedBox(height: 10,),


                CustomFormField(width: width, height: height,textBody: "Enter Product Category",textHead: "Product Category",controller: _productController.productCategoryController, 
                validator: (value) => _productController.validate(value, "Product Category"), type: TextInputType.text,),

                const SizedBox(height: 10,),

                Row(
                  children: [


                    CustomFormField(width: width*0.3, height: height,textBody: "l",textHead: "Length",controller: _productController.lengthController, 
                    validator: (value) => _productController.validateDimention(value, "Length"), type: TextInputType.number,),


                    SizedBox(width: width*0.05,),


                    CustomFormField(width: width*0.3, height: height,textBody: "w",textHead: "Width",controller: _productController.widthController,
                     validator: (value) => _productController.validateDimention(value, "Width"), type: TextInputType.number,),

                      
                    SizedBox(width: width*0.05,),


                    CustomFormField(width: width*0.3, height: height,textBody: "b",textHead: "Breadth",controller: _productController.breadthController,
                     validator: (value) => _productController.validateDimention(value, "Breadth"), type: TextInputType.number
                    ),

                  ],
                ),


                const SizedBox(height: 10,),

                Row(
                  children: [
                    CustomFormField(width: width*0.3, height: height,textBody: "grams",textHead: "Weight",controller: _productController.weightController, 
                    validator: (value) => _productController.validateDimention(value, "Weight"), type:const  TextInputType.numberWithOptions(
                      decimal: true,
                    ),),

                    SizedBox(width: width*0.05,),
                    
                    CustomFormField(width: width*0.3, height: height,textBody: "Size",textHead: "Size",controller: _productController.sizeController,
                     validator: (value) => _productController.validateDimention(value, "Size"), type: TextInputType.text,),

                      
                    SizedBox(width: width*0.05,),


                    CustomFormField(width: width*0.3, height: height,textBody: "No.",textHead: "Quantity",controller: _productController.quantityController,
                     validator: (value) => _productController.validate(value, "Quantity"), type: TextInputType.number,)
                  ],
                ),
                
                const SizedBox(height: 10,),

                Row(
                  children: [
                    CustomFormField(width: width*0.45, height: height,textBody: "Price",textHead: "Cost Price",controller: _productController.costPriceController, 
                    validator: (value) => _productController.validate(value, "Cost Price"), type: const TextInputType.numberWithOptions(decimal: true),),


                    SizedBox(width: width*0.05,),
                    CustomFormField(width: width*0.45, height: height,textBody: "Price",textHead: "Market Price",controller: _productController.marketPriceController,
                      validator: (value) => _productController.validate(value, "Market Price"),type: const TextInputType.numberWithOptions(decimal: true),),
                  ],
                ),

  
                const SizedBox(height: 10,),
                SizedBox(height: height *0.1,),
                
                Center(
                  child: SizedBox(
                    width: width*0.4,
                    height: height*0.065,
                    child: ElevatedButton(
                      onPressed: (){
                        _productController.addToDb();
                      },
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
