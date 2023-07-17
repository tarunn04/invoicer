import 'package:get/get.dart';
import 'package:invoicer/screens/add_product.dart';
import 'package:invoicer/screens/home_screen.dart';
import 'package:invoicer/screens/product_page.dart';

import '../screens/category_product.dart';
import '../screens/product_edit.dart';

appRoutes() => [
  GetPage(name: "/productPage", 
  page: () => ProductPage(),
  ),

  GetPage(name: "/addProduct", 
  page: () => AddProducts(),
  ),

  GetPage(name: "/editProduct", 
  page: () => EditProduct(),
  ),

  GetPage(name: "/", 
  page: () => HomeScreen(),
  ),

GetPage(name: "/categoryProductPage", 
  page: () => CategoryProductPage(category: Get.arguments as String),
  ),
  
];
//  GetPage(name: '/wallpaperPage',
//    page: () => WallpaperPage(url: Get.arguments as String),
//    transition: Transition.noTransition,
//    ),
   