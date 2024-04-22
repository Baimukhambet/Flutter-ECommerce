import 'package:flutter/material.dart';
import 'package:shop_app/features/home_page/widgets/card_tile.dart';
import 'package:shop_app/features/home_page/widgets/category_tile.dart';
import 'package:shop_app/features/home_page/widgets/my_search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MySearchField(
            onTap: () {},
            readOnly: true,
          ),
          Container(
            // padding: EdgeInsets.only(left: 8),
            height: 72,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CategoryTile();
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
                return CardTile();
              },
            ),
          )
        ],
      ),
    );
  }
}
