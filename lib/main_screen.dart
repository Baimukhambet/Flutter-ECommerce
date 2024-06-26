import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/cart_page/cart_screen.dart';
import 'package:shop_app/features/categories_page/categories_screen.dart';
import 'package:shop_app/features/favorites_page/screens/favorites_screen.dart';
import 'package:shop_app/features/home_page/home_screen.dart';
import 'package:shop_app/features/home_page/widgets/navigation_bar.dart';
import 'package:shop_app/features/profile_page/profile_screen.dart';
import 'package:shop_app/repositories/providers/tab_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  int _currentTabIndex = 0;
  String appBarTitle = "SHOPPY";
  bool centerTitle = false;

  void _tabChanged(int index) {
    setState(() {
      Provider.of<TabManager>(context, listen: false).changeCurrentTab(index);
      if (index == 1) {
        appBarTitle = "Categories";
        centerTitle = true;
      } else if (index == 3) {
        appBarTitle = "Cart";
        centerTitle = true;
      } else {
        appBarTitle = "SHOPPY";
        centerTitle = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Consumer<TabManager>(
      builder: (context, manager, child) => Scaffold(
        bottomNavigationBar: MyNavBar(
          onTabChange: _tabChanged,
        ),
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: centerTitle,
          title: Text(appBarTitle, style: theme.textTheme.headlineLarge),
        ),
        body: IndexedStack(
          index: manager.currentTabIndex,
          children: _screens,
        ),
      ),
    );
  }
}
