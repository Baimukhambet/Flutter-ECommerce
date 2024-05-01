import 'package:flutter/material.dart';
import 'package:shop_app/repositories/models/product_model.dart';
import 'package:shop_app/repositories/product_repository.dart';
import 'package:shop_app/repositories/sql_manager.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> _favorites = [];
  final ProductRepository productRepository = ProductRepository.shared;
  List<Product> get favorites => _favorites;

  FavoritesProvider() {
    fetchFavorites();
  }

  void addToFavorites(Product product) async {
    await SQLManager.addFavorite(product.id);
    _favorites.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) async {
    _favorites.remove(product);
    await SQLManager.removeFavorite(product.id);
    notifyListeners();
  }

  void fetchFavorites() async {
    final data = await SQLManager.getFavorites();
    final ids = data.map((e) => e['id'] as int).toList();
    if (ids.isNotEmpty) {
      _favorites.addAll(productRepository.getProductsByIds(ids));
    }
    notifyListeners();
    debugPrint("Finished fetching");
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}
