import 'package:shop_app/repositories/models/category.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imagePath;
  final Category category;
  final Gender? gender;
  final List<String> sizes;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
    this.gender,
    required this.sizes,
  });

  @override
  bool operator ==(p) => (p as Product).title == title;

  @override
  int get hashCode => Object.hash(title, description);
}
