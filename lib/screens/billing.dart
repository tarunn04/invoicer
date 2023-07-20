import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoicer/controller/invoice_controller.dart';

import '../constants/text_theme.dart';

class Billing extends StatefulWidget {
  // Map <String,dynamic> customerData = Get.arguments as Map<String,dynamic>;
  Billing({super.key});

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  var selectedOption;
  final InvoiceController _invoiceController = Get.put(InvoiceController());
  @override 
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Billing",style: MyTextTheme.bodyHead.copyWith(fontSize: 22)),
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_ios),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                children: [
                  Text("Billing To",style: MyTextTheme.bodyHead,),
                  Spacer(),

                  // !_invoiceController.isAdded.value?
                  // InkWell(
                  //   onTap: (){
                  //     Get.toNamed("/addCustomer");
                  //   },
                  //   child: Text("Add Customer",style: MyTextTheme.bodyText.copyWith(color:const Color.fromARGB(255, 0, 83, 151),fontSize: 16),))
                  // : Text(""),
                ],
              ),
              const SizedBox(height: 10,),
              
              Container(
                width: width*0.9,
                height: height*0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),

                child:
                 Obx(() =>  _invoiceController.customer.isNotEmpty?
                 ListTile(
                    contentPadding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    title: Text(_invoiceController.customer['customerName'],style: MyTextTheme.bodyText,),
                    subtitle: Text(_invoiceController.customer['customerPhone'],style: MyTextTheme.bodyText.copyWith(color:const  Color.fromARGB(200, 78, 78, 78),),),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/editCustomer");
                          },
                          child: Text("edit",style: MyTextTheme.bodyText.copyWith(color:const Color.fromARGB(255, 0, 83, 151),fontSize: 16),)),
                        const SizedBox(height: 2,),
                        Text(_invoiceController.customer['customerEmail'],style: MyTextTheme.bodyText.copyWith(fontSize: 14)),
                      ],
                    ),
                    
                  ):
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed("/addCustomer");
                      },
                      child: Text("Add Customer(+)",style: MyTextTheme.bodyText.copyWith(fontSize: 18,color: const Color.fromARGB(255, 0, 83, 151),),)),
                  )
                ),
              ),
              
              const SizedBox(height: 20,),
              
              //product details
              Row(
                children: [
                  Text("Product Details",style: MyTextTheme.bodyHead,),
                  const Spacer(),
                  InkWell(
                    onTap: (){},
                    child: Text("Add Product",style: MyTextTheme.bodyText.copyWith(color:const Color.fromARGB(255, 0, 83, 151),fontSize: 16),)),
                ],
              ),
              const SizedBox(height: 10,),
              
              Container(
                width: width*0.9,
                height: height*0.14,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                padding:const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "Nadora Light Green",
                              style: MyTextTheme.bodyText,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Flexible(
                            child: Text(
                              "Carpet",
                              style: MyTextTheme.bodyText.copyWith(
                                color: const Color.fromARGB(200, 78, 78, 78),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Size(12x43x43)",
                            style: MyTextTheme.bodyText.copyWith(fontSize: 14,color: const Color.fromARGB(200, 78, 78, 78),)
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "edit",
                            style: MyTextTheme.bodyText.copyWith(
                              color: const Color.fromARGB(255, 0, 83, 151),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text("1x ₹1000",style: MyTextTheme.bodyText.copyWith(fontSize: 14),),
                        const SizedBox(height: 1),
                        Text("₹ 1000",style: MyTextTheme.bodyText.copyWith(fontSize: 18,color: Colors.green),),
                      ],
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 10,),
              Text("Billing Total ",style: MyTextTheme.bodyHead,),
              const SizedBox(height: 10,),  
              Container(
                width: width*0.9,
                height: height*0.13,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sub Total",style: MyTextTheme.bodyText.copyWith(fontSize: 16),),
                        const SizedBox(height: 2,),
                        Text("Total",style: MyTextTheme.bodyText.copyWith(fontSize: 16),),
                      ],
                    ),
                    Text("₹ 1000",style: MyTextTheme.bodyText.copyWith(fontSize: 16),),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Text("Payment Method",style: MyTextTheme.bodyHead,),
              const SizedBox(height: 10,),
        
              Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    // Handle radio button selection
                    selectedOption = value;
                  },
                  
                ),
                Text(
                  "Cash",
                  style: MyTextTheme.bodyText.copyWith(fontSize: 16),
                ),
                const SizedBox(width: 15,),
                Radio(
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    // Handle radio button selection
                    selectedOption = value;
                  },
                ),
                Text(
                  "Card",
                  style: MyTextTheme.bodyText.copyWith(fontSize: 16),
                ),
                const SizedBox(width: 15,),
        
                Radio(
                  value: 3,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    // Handle radio button selection
                    selectedOption = value;
                  },
                ),
                Text(
                  "UPI",
                  style: MyTextTheme.bodyText.copyWith(fontSize: 16),
                ),
              ],
            ),
              
            const SizedBox(height: 20,),
            Center(
              child: Container(
                height: height*0.06,
                width: width*0.4,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  border: Border.all(color: Colors.grey)
                 
                ),
                 child: Center(
                    child: Text("Generate Invoice",style: MyTextTheme.bodyText.copyWith(fontSize: 16),),
                  ),
              ),
            ),
              ],
          ),
        ),
      ),
    );
  }
}
