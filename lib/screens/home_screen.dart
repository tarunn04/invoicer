import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:invoicer/constants/colors.dart';
import 'package:invoicer/constants/text_theme.dart';
import 'package:invoicer/widget/search_text_field.dart';

import '../controller/product_controller.dart';
import '../controller/product_page_controller.dart';
import '../widget/nav_bar.dart';
import '../widget/sales_info_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductPageController _productPageController = Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: themeBlue,
              height: height*0.30,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: height*0.07,),
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("DASHBOARD",style: MyTextTheme.heading.copyWith(color: themeCream),),
                        IconButton(onPressed: (){}, 
                        icon: Icon(
                          Icons.settings,
                          size: 35,
                          color: themeCream,
                          ),
                        )
                      ],
                    ),
                    
                    SizedBox(height: height*0.04,),
                    
                    // SearchTextField(),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sales Overview",style: MyTextTheme.bodyHead),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SalesInfoContainer(overview: "Total Sales",width: width, height: height),
                      SalesInfoContainer(overview: "Profit Made",width: width, height: height),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Text("Category",style: MyTextTheme.bodyHead),
                  const SizedBox(height: 10,),
                  
                  Obx(() => 
                    GridView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:_productPageController.categorySet.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.8,
                        ), 
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed("/categoryProductPage",arguments: _productPageController.categorySet.elementAt(index));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: themeOrangePrimary,width: 1.5),
                            ),
                            child: Center(
                              child: Text(
                                _productPageController.categorySet.elementAt(index).toUpperCase(),
                                style: MyTextTheme.bodyHead.copyWith(
                                ),
                            ))
                          ),
                        );
                      },
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
