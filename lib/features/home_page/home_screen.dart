import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/home_page/widgets/overlay_message.dart';
import 'package:shop_app/features/home_page/widgets/widgets.dart';
import 'package:shop_app/features/product_page/product_screen.dart';
import 'package:shop_app/features/search_page/search_screen.dart';
import 'package:shop_app/repositories/models/category.dart';
import 'package:shop_app/repositories/models/product_model.dart';
import 'package:shop_app/repositories/product_repository.dart';
import 'package:shop_app/repositories/providers/cart_provider.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
                    onHeartTap: () {
                      final isFavorite = provider.isFavorite(product);
                      isFavorite
                          ? provider.removeFromFavorites(product)
                          : provider.addToFavorites(product);
                      showTopSnackBar(
                          displayDuration: const Duration(milliseconds: 300),
                          Overlay.of(context),
                          isFavorite
                              ? const OverlayMessage(
                                  text: 'Removed From Wishlist')
                              : const OverlayMessage(
                                  text: 'Added To Wishlist'));
                    },
                    onBagTap: () {
                      final isInCart = provider.isInCart(product);
                      isInCart
                          ? provider.removeFromCart(product)
                          : provider.addToCart(product);
                      showTopSnackBar(
                          displayDuration: const Duration(milliseconds: 300),
                          Overlay.of(context),
                          isInCart
                              ? const OverlayMessage(text: 'Removed From Cart')
                              : const OverlayMessage(text: 'Added To Cart'));
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
