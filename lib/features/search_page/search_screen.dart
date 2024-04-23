import 'package:flutter/material.dart';
import 'package:shop_app/features/home_page/widgets/category_tile.dart';
import 'package:shop_app/features/home_page/widgets/my_search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MySearchField(
          readOnly: false,
        ),
        centerTitle: true,
        leadingWidth: 44,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_outlined),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus) {
            focus.unfocus();
          }
        },
        child: Column(
          children: [
            SizedBox(
              // padding: EdgeInsets.only(left: 8),
              height: 72,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      title: "Check",
                      isActive: true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
