import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoicer/widget/searchbar.dart';

import '../constants/text_theme.dart';
import '../controller/product_page_controller.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductPageController _productPageController =
      Get.put(ProductPageController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Product Page",
          style: MyTextTheme.bodyHead.copyWith(fontSize: 22),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(),
        onPressed: () {
          Get.toNamed("/addProduct");
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0,),
            child: SearchTextField(
            onChanged: (p0) => _productPageController.filterProducts(p0),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _productPageController.filteredProducts.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> product =
                      _productPageController.filteredProducts[index];

                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                    child: Container(
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product["productName"],
                                  style: MyTextTheme.bodyHead.copyWith(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  product["productCategory"],
                                  style: MyTextTheme.bodyText,
                                ),
                                
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Market Price",style: MyTextTheme.bodyText.copyWith(fontSize: 14),),
                                Text(
                                  "₹ ${product["marketPrice"]}",
                                  style: MyTextTheme.bodyHead.copyWith(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                      
                                Text(
                                  "Stock: ${product["quantity"]}",
                                  style: MyTextTheme.bodyHead.copyWith(
                                      fontSize: 14,),
                                )
                                
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
