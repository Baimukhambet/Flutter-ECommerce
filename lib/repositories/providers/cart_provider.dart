import 'package:flutter/material.dart';
import 'package:shop_app/repositories/models/models.dart';
import 'package:shop_app/repositories/models/product_model.dart';
import 'package:shop_app/repositories/product_repository.dart';
import 'package:shop_app/repositories/sql_manager.dart';

class CartProvider extends ChangeNotifier {
  Map<Product, int> _cart = {};

  final ProductRepository productRepository = ProductRepository.shared;

  CartProvider() {
    fetchCart();
  }

  void addToCart(Product product) async {
    _cart.addEntries((<Product, int>{product: 1}).entries);
    await SQLManager.addToCart(product.id);
    notifyListeners();
  }

  void removeFromCart(Product product) async {
    _cart.remove(product);
    await SQLManager.removeFromCart(product.id);
    notifyListeners();
  }

  void incrementTotal(Product product) {
    _cart[product] = _cart[product]! + 1;
    notifyListeners();
  }

  void decrementTotal(Product product) {
    if (_cart[product]! >= 2) {
      _cart[product] = _cart[product]! - 1;
      notifyListeners();
    }
  }

  void fetchCart() async {
    final data = await SQLManager.getCart();
    if (data.isNotEmpty) {
      final ids = data.map((e) => e['id'] as int).toList();
      final products = productRepository.getProductsByIds(ids);
      _cart.addEntries(products.map((p) => MapEntry(p, 1)));
    }
    notifyListeners();
  }

  bool isInCart(Product product) {
    return _cart.containsKey(product);
  }

  double getTotalCart() {
    double total = 0;
    _cart.forEach((key, value) {
      total += key.price * value;
    });
    return total;
  }

  List<Product> get cartEntries => _cart.keys.toList();
  Map<Product, int> get cartMap => _cart;
}
