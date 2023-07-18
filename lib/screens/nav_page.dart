import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:invoicer/widget/nav_bar.dart';

import '../controller/nav_bar_controller.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController _navBarController = Get.put(NavBarController());
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: Obx(() => _navBarController.pages[_navBarController.selectedIndex.value],
      ),
    );
  }
}