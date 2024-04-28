import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/home_page/home_page.dart';
import 'package:shop_app/repositories/providers/cart_provider.dart';
import 'package:shop_app/repositories/providers/tab_manager.dart';
import 'package:shop_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TabManager(),
        )
      ],
      child: MaterialApp(
        theme: theme,
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
