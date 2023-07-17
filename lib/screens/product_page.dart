import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoicer/widget/search_text_field.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../constants/text_theme.dart';
import '../controller/product_page_controller.dart';
import '../widget/product_view_container.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductPageController _productPageController =
      Get.put(ProductPageController());
  final EasyRefreshController _refreshController = EasyRefreshController();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
  }

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
          
        SearchTextField(controller: _productPageController.searchController,onChanged: (query) {
          _productPageController.searchProducts(query);
          
        },),

         Expanded(
          child: Obx(() => 
              EasyRefresh(
                controller: _refreshController,
                onRefresh: _productPageController.fetchProducts,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: _productPageController.productList.length,
                  itemBuilder: (context, index) {
                    final product = _productPageController.productList[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: productViewContainer(
                        height: height, 
                        product: product.toJson(),
                        ),
                    );
                  },
                  ),
              ), 
            ),
          )
         
        ]
      ),
    );
  }
}
