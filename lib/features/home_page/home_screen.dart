import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/home_page/widgets/card_tile.dart';
import 'package:shop_app/features/home_page/widgets/category_tile.dart';
import 'package:shop_app/features/home_page/widgets/my_search_field.dart';
import 'package:shop_app/features/product_page/product_screen.dart';
import 'package:shop_app/features/search_page/search_screen.dart';
import 'package:shop_app/repositories/models/category.dart';
import 'package:shop_app/repositories/models/product_model.dart';
import 'package:shop_app/repositories/product_repository.dart';
import 'package:shop_app/repositories/providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Gender> genders = [
    Gender.all,
    Gender.woman,
    Gender.man,
  ];

  final ProductRepository productRepository = ProductRepository();
  List<Product> currentShowingProducts = [];

  int _currentCategoryIndex = 0;

  void _changeGenderCategory(int index) {
    setState(() {
      _currentCategoryIndex = index;

      currentShowingProducts =
          productRepository.getProductsByGender(genders[index]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentShowingProducts = productRepository.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CartProvider>(context, listen: false);
    return Consumer<CartProvider>(builder: (context, provider, child) {
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
                  itemCount: genders.length,
                  itemBuilder: (context, index) {
                    final bool active = (index == _currentCategoryIndex);
                    return CategoryTile(
                      title: genders[index].toStr(),
                      isActive: active,
                      onTap: () {
                        _changeGenderCategory(index);
                      },
                    );
                  },
                ),
              ),
            ),
            Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemCount: currentShowingProducts.length,
                itemBuilder: (context, index) {
                  final product = currentShowingProducts[index];
                  return CardTile(
                    product: product,
                    onHeartTap: () => provider.addToFavorites(product),
                    onBagTap: () {
                      provider.addToCart(product);
                    },
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            product: currentShowingProducts[index]),
                      ));
                    },
                    isFavorite: provider.isFavorite(product),
                    isInCart: provider.isInCart(product),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
