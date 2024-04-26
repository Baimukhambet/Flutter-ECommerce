import 'package:flutter/material.dart';
import 'package:shop_app/repositories/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<Product, int> _cart = {};

  void addToCart(Product product) {
    _cart.addEntries((<Product, int>{product: 1}).entries);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
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

  List<Product> get cartEntries => _cart.keys.toList();
  Map<Product, int> get cartMap => _cart;
}
