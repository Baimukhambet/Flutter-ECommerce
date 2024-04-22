import 'package:flutter/material.dart';
import 'package:shop_app/features/home_page/home_page.dart';
import 'package:shop_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
