import 'package:shop_app/repositories/models/category.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String imagePath;
  final Category category;
  final Gender? gender;
  final List<String> sizes;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
    this.gender,
    required this.sizes,
  });

  operator ==(p) => (p as Product).title == title;
}
