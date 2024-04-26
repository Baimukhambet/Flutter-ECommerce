import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/cart_page/widgets/cart_item.dart';
import 'package:shop_app/repositories/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        final products = provider.cartEntries;
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => CartItem(
            product: products[index],
            count: provider.cartMap[products[index]]!,
            onIncrement: () {
              provider.incrementTotal(products[index]);
            },
            onDecrement: () {
              provider.decrementTotal(products[index]);
            },
            onRemove: () {
              provider.removeFromCart(products[index]);
            },
          ),
        );
      },
    );
  }
}
