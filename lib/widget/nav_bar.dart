
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    backgroundColor: themeBlue,
    selectedItemColor: themeOrangePrimary,
    unselectedItemColor: themeCream,
    
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "Add",
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.printer_fill),
        label: "Invoice",
      ),
      
    ],
    );
  }
}
