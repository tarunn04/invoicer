import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:invoicer/constants/colors.dart';
import 'package:invoicer/constants/text_theme.dart';
import 'package:invoicer/controller/invoice_controller.dart';
import 'package:invoicer/controller/nav_bar_controller.dart';
import 'package:invoicer/controller/product_controller.dart';
import 'package:invoicer/widget/nav_bar.dart';

import '../widget/custom_form_field.dart';
import '../widget/custom_search_box.dart';

class EditCustomer extends StatefulWidget {
   EditCustomer({super.key});
  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {

  final InvoiceController _invoiceController = Get.put(InvoiceController());
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Edit Customer",style: MyTextTheme.bodyHead.copyWith(fontSize: 22)),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: (){
              _invoiceController.clearController();
              _invoiceController.customer.clear();
              _invoiceController.isAdded.value = false;
              Get.back();
            },
            icon: const Icon(Icons.delete,color: Color.fromARGB(255, 183, 54, 45),),
          ) ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomFormField(width: width, height: height,textBody: "Enter Customer Name",textHead: "Customer Name", controller: _invoiceController.customerNameController, 

                validator: (value) => _invoiceController.validate(value, "Customer Name"), 
                
                type: TextInputType.text,),
                
                const SizedBox(height: 10,),


                CustomFormField(width: width, height: height,textBody: "Enter Customer Email",textHead: "Customer Email",controller: _invoiceController.customerEmailController, 
                validator: (value) => _invoiceController.validateEmail(value, "Customer Email"), type: TextInputType.text,),

                const SizedBox(height: 10,),

            
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomFormField(width: width*0.6, height: height,textBody: "Enter Phone Number",textHead: "Customer Phone Number",
                    controller: _invoiceController.customerPhoneController,
                     validator: (value) => _invoiceController.validatePhone(value, "Customer Email"), type: TextInputType.phone,),
                    SizedBox(width: width*0.06,),
                    SizedBox(
                    width: width*0.3,
                    height: height*0.07,
                    child: ElevatedButton(
                      onPressed: (){
                        _invoiceController.editCustomer(_formKey);
                      },
                      style: ElevatedButton.styleFrom(
          
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                          )
                          
                        )
                      ),
                      child:  Text("Edit",style: MyTextTheme.bodyText.copyWith(fontSize: 16),),
                    ),
                  ),
                  ],
                ),
              
              ],
          ),
        )
      ),
    );
  } 
}
