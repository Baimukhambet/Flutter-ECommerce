import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/favorites_page/widgets/favorite_item.dart';
import 'package:shop_app/features/product_page/product_screen.dart';
import 'package:shop_app/repositories/models/product_model.dart';
import 'package:shop_app/repositories/providers/cart_provider.dart';
import 'package:shop_app/repositories/providers/favorites_provider.dart';
import 'package:shop_app/repositories/providers/tab_manager.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, provider, child) {
        onIconTap(Product product) {
          provider.removeFromFavorites(product);
        }

        return provider.favorites.isNotEmpty
            ? _buildFavoritesScreen(context, provider.favorites, onIconTap)
            : _buildEmptyFavoritesScreen(context);
      },
    );
  }

  Widget _buildFavoritesScreen(BuildContext context, List<Product> products,
      Function(Product product) onIconTap) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => FavoriteItem(
        product: products[index],
        onTap: () {
          context.pushNamed('/product', extra: products[index]);
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => ProductScreen(product: products[index]),
          // ));
        },
        onIconTap: () => onIconTap(products[index]),
      ),
    );
  }

  Widget _buildEmptyFavoritesScreen(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Your wishlist is empty!"),
        const SizedBox(height: 16),
        MaterialButton(
          onPressed: () {
            Provider.of<TabManager>(context, listen: false).changeCurrentTab(0);
          },
          child: Text("Go To Main Page"),
          shape: Border.all(
            color: Colors.black,
          ),
        ),
      ],
    ));
  }
}
