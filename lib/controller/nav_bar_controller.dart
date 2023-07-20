

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:invoicer/screens/add_product.dart';
import 'package:invoicer/screens/home_screen.dart';
import 'package:invoicer/screens/billing.dart';
import 'package:invoicer/screens/product_page.dart';

class NavBarController extends GetxController{
  RxInt selectedIndex = 0.obs;

  
  changeIndex(int index){
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    ProductPage(),
    Billing(),
    ProductPage(),
    ProductPage(),
  ];

  List<Widget> destinations =const  [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    NavigationDestination(
      icon: Icon(Icons.add),
      label: "Add",
    ),
     NavigationDestination(
      icon: Icon(Icons.print),
      label: "Invoice",
    ),
    NavigationDestination(
      icon: Icon(Icons.edit),
      label: "Edit",
    ),
    NavigationDestination(
      icon: Icon(CupertinoIcons.chart_bar_alt_fill),
      label: "Report",
    ),

  ];
}