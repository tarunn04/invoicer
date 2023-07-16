import 'package:get/get.dart';
import 'package:invoicer/screens/add_product.dart';
import 'package:invoicer/screens/product_page.dart';

appRoutes() => [
  GetPage(name: "/productPage", 
  page: () => ProductPage(),
  ),

  GetPage(name: "/addProduct", 
  page: () => AddProducts(),
  ),

];