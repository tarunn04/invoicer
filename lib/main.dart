import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:invoicer/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invoicer/routes/routes.dart';
import 'package:invoicer/screens/add_customer.dart';
import 'package:invoicer/screens/add_product.dart';
import 'package:invoicer/screens/category_product.dart';
import 'package:invoicer/screens/home_screen.dart';
import 'package:invoicer/screens/invoice_generate.dart';
import 'package:invoicer/screens/billing.dart';
import 'package:invoicer/screens/login_page.dart';
import 'package:invoicer/screens/nav_page.dart';
import 'package:invoicer/screens/product_page.dart';
import 'package:invoicer/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 60, 59, 59)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: appRoutes(),
      home: Billing(),
    );
  }
}
