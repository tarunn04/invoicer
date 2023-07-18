
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/colors.dart';
import '../controller/nav_bar_controller.dart';

class NavBar extends StatelessWidget {
 NavBar({super.key});
  NavBarController _navBarController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 50,

        backgroundColor: themeWhite,
        selectedIndex: _navBarController.selectedIndex.value,

        onDestinationSelected: (value) {
          _navBarController.changeIndex(value);
        },
        elevation: 1,
        indicatorColor: Colors.white.withOpacity(0),
        animationDuration: Duration(milliseconds: 1000),
        
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: _navBarController.destinations,
    );
  }
}