import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/cart_page/widgets/cart_item.dart';
import 'package:shop_app/features/product_page/product_screen.dart';
import 'package:shop_app/repositories/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        final products = provider.cartEntries;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductScreen(product: products[index])));
                  },
                ),
              ),
            ),
            Text("Total: \$${provider.getTotalCart().toStringAsFixed(2)}"),
            Container(
              padding: EdgeInsets.only(top: 12),
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: const Text('Checkout',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
