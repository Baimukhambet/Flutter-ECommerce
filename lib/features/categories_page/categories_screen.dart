import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/features/categories_page/widgets/category_tile.dart';
import 'package:shop_app/repositories/models/models.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<String> categoryNames = Category.values
      .map(
        (e) => e.toStr(),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryNames.length,
      itemBuilder: (context, index) {
        return CategoryItem(title: categoryNames[index]);
      },
    );
  }
}
