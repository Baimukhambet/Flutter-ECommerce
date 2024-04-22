import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/features/cart_page/cart_screen.dart';
import 'package:shop_app/features/categories_page/categories_screen.dart';
import 'package:shop_app/features/favorites_page/favorites_screen.dart';
import 'package:shop_app/features/home_page/home_screen.dart';
import 'package:shop_app/features/home_page/widgets/card_tile.dart';
import 'package:shop_app/features/home_page/widgets/category_tile.dart';
import 'package:shop_app/features/home_page/widgets/my_search_field.dart';
import 'package:shop_app/features/home_page/widgets/navigation_bar.dart';
import 'package:shop_app/features/profile_page/profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  int _currentTabIndex = 0;

  void _tabChanged(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: MyNavBar(
        onTabChange: _tabChanged,
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Text("Snapbar", style: theme.textTheme.titleLarge),
      ),
      body: _screens[_currentTabIndex],
    );
  }
}
