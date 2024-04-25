import 'package:shop_app/repositories/models/models.dart';

class ProductRepository {
  final List<Product> _products = [
    Product(
        title: "Dua Lipa",
        description: "Dua Dua my Dua lipa!",
        price: 100,
        imagePath:
            'https://www.rollingstone.com/wp-content/uploads/2022/08/dua-lipa.jpg?w=1600&h=900&crop=1',
        category: Category.shirts),
    Product(
        title: "Basic Slim Fit T-Shirt",
        description: "Dua Dua my Dua lipa!",
        price: 100,
        imagePath:
            'https://static.zara.net/assets/public/c334/7262/b6c64a7da540/3b251ea8639b/05584361250-e1/05584361250-e1.jpg?ts=1701795761728&w=850',
        category: Category.shirts),
    Product(
        title: "BASIC MEDIUM WEIGHT T-SHIRT",
        description: "Dua Dua my Dua lipa!",
        price: 9.99,
        imagePath:
            'https://static.zara.net/assets/public/6fe7/9b7c/a8264d6d81ee/abc8f8100037/01887470800-e1/01887470800-e1.jpg?ts=1703084878835&w=850',
        category: Category.shirts),
    Product(
        title: "Dua Lipa",
        description: "Dua Dua my Dua lipa!",
        price: 100,
        imagePath:
            'https://static.zara.net/assets/public/9e50/a954/542e4cf586f0/38767a2ebedc/01887470800-a4/01887470800-a4.jpg?ts=1703151663649&w=850',
        category: Category.shirts),
    Product(
        title: "Dua Lipa",
        description: "Dua Dua my Dua lipa!",
        price: 100,
        imagePath:
            'https://www.rollingstone.com/wp-content/uploads/2022/08/dua-lipa.jpg?w=1600&h=900&crop=1',
        category: Category.shirts),
    Product(
        title: "Dua Lipa",
        description: "Dua Dua my Dua lipa!",
        price: 100,
        imagePath:
            'https://www.rollingstone.com/wp-content/uploads/2022/08/dua-lipa.jpg?w=1600&h=900&crop=1',
        category: Category.shirts),
  ];

  List<Product> getProducts() {
    return _products;
  }
}
