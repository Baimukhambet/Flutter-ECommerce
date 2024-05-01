import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/features/categories_page/widgets/category_item.dart';
import 'package:shop_app/features/list_product_page/list_product_screen.dart';
import 'package:shop_app/repositories/models/models.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Category> categories = Category.values;

  final List<String> imageUrls = [
    'https://static.zara.net/assets/public/6fe7/9b7c/a8264d6d81ee/abc8f8100037/01887470800-e1/01887470800-e1.jpg?ts=1703084878835&w=850',
    'https://static.zara.net/assets/public/079b/2a66/3e02411fa6e1/dd8acaa6721a/08307401427-e1/08307401427-e1.jpg?ts=1711010693395&w=850',
    'https://static.zara.net/assets/public/c66c/d741/0be64e3a9e0f/7ed764b35a03/04302404800-e1/04302404800-e1.jpg?ts=1705336385016&w=850',
    'https://static.zara.net/assets/public/1492/d7e0/229a410bb2a5/4550b69aed72/1688110917303/1688110917303.jpg?ts=1703700858610&w=850',
    'https://static.zara.net/assets/public/2d95/abb7/b1c34ffc83b9/cfb5f1c7296c/12490320800-e1/12490320800-e1.jpg?ts=1713266706329&w=850'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          title: categories[index].toStr(),
          imageUrl: imageUrls[index],
          onTap: () {
            context.pushNamed('/category', pathParameters: {'id': '$index'});
          },
        );
      },
    );
  }
}
