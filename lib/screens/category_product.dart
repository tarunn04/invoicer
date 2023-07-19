import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoicer/widget/search_text_field.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../constants/text_theme.dart';
import '../controller/category_page_controller.dart';
import '../controller/product_page_controller.dart';
import '../widget/product_view_container.dart';

class CategoryProductPage extends StatefulWidget {
  String category;

   CategoryProductPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryProductPage> createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {

  final CategoryProductPageController _categoryProductPageController = Get.put(CategoryProductPageController());

  @override
  void initState() {
    // TODO: implement initState
    _categoryProductPageController.fetchDataFromCategory(widget.category);
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "${widget.category.capitalizeFirst} Page",
          style: MyTextTheme.bodyHead.copyWith(fontSize: 22),
        ),

        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 30,),
           SearchTextField(controller: _categoryProductPageController.searchController,onChanged: (query) {
          _categoryProductPageController.searchProducts(query);
          
        },),

          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.only(top: 20 ),
                itemCount: _categoryProductPageController.productsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed("/editProduct",arguments: _categoryProductPageController.productsList[index].toJson());
                      },
                      child: productViewContainer(
                        height: height,
                        product: _categoryProductPageController.productsList[index].toJson(),
                      ),
                    ),
                  );
                },),
            ),
          )
          
        ]
      ),
    );
  }
}
