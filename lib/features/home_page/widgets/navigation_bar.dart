import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavBar extends StatelessWidget {
  MyNavBar({super.key, this.onTabChange});

  final List<GButton> tabs = const [
    GButton(icon: Icons.home),
    GButton(
      icon: Icons.category,
      text: "Category",
    ),
    GButton(
      icon: Icons.favorite,
    ),
    GButton(
      icon: Icons.shopping_bag,
    ),
    GButton(
      icon: Icons.person,
    )
  ];

  void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8),
        child: GNav(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          onTabChange: onTabChange,
          activeColor: Colors.white,
          tabs: tabs,
          tabBackgroundColor: Colors.black,
          // tabBorder: Border.all(color: Colors.grey, width: 1),
          // tabBorderRadius: 15,
        ),
      ),
    );
  }
}
