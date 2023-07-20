import 'package:get/get.dart';
import 'package:invoicer/screens/add_customer.dart';
import 'package:invoicer/screens/add_product.dart';
import 'package:invoicer/screens/billing.dart';
import 'package:invoicer/screens/edit_customer.dart';
import 'package:invoicer/screens/edit_product.dart';
import 'package:invoicer/screens/home_screen.dart';
import 'package:invoicer/screens/product_page.dart';

import '../screens/category_product.dart';
import '../screens/nav_page.dart';

appRoutes() => [
  GetPage(name: "/productPage", 
  page: () => ProductPage(),
  ),

  GetPage(name: "/addProduct", 
  page: () => AddProducts(),
  ),

 GetPage(name: "/editProduct", 
  page: () => EditProduct(product: Get.arguments as Map<String, dynamic>),
  ),

  GetPage(name: "/", 
  page: () => HomeScreen(),
  ),

GetPage(name: "/categoryProductPage", 
  page: () => CategoryProductPage(category: Get.arguments as String),
  ),
  
  GetPage(name: "/navPage", 
  page: () => NavPage(),
  ),
  GetPage(name: "/addCustomer", 
  page: () => AddCustomer(),
  ),

  GetPage(name: "/editCustomer", 
  page: () => EditCustomer(),
  ),


  GetPage(name: "/billing", 
  page: () => Billing(),
  ),
  
  
];
//  GetPage(name: '/wallpaperPage',
//    page: () => WallpaperPage(url: Get.arguments as String),
//    transition: Transition.noTransition,
//    ),
   