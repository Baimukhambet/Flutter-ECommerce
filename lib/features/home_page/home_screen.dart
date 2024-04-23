import 'package:flutter/material.dart';
import 'package:shop_app/features/home_page/widgets/card_tile.dart';
import 'package:shop_app/features/home_page/widgets/category_tile.dart';
import 'package:shop_app/features/home_page/widgets/my_search_field.dart';
import 'package:shop_app/features/search_page/search_screen.dart';
import 'package:shop_app/repositories/models/category_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MainCategory> cats = [
    MainCategory.all,
    MainCategory.woman,
    MainCategory.man,
    MainCategory.kid
  ];

  int _currentCategoryIndex = 0;

  void _categoryTileTapped(int index) {
    setState(() {
      _currentCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MySearchField(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ));
            },
            readOnly: true,
          ),
          SizedBox(
            // padding: EdgeInsets.only(left: 8),
            height: 72,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  final bool active = (index == _currentCategoryIndex);
                  return CategoryTile(
                    title: cats[index].toStr(),
                    isActive: active,
                    onTap: () => _categoryTileTapped(index),
                  );
                },
              ),
            ),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CardTile();
              },
            ),
          )
        ],
      ),
    );
  }
}
