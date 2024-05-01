import 'package:shop_app/repositories/models/models.dart';

class ProductRepository {
  final List<Product> _products = [
    Product(
        id: 1,
        title: "HOODED Technical JACKET",
        description:
            "Jacket made of technical fabric. High neck with adjustable drawstring hood. Long sleeves with ribbed cuffs. Chest welt pocket and hip patch pockets. Interior pocket detail. Adjustable hem with elastic at the sides. Front zip fastening hidden by a snap-button placket.",
        price: 94.99,
        imagePath: 'https://static.zara.net/assets/public/324b/2664/6e7d4a898516/49ed70153f28/08281355800-e1/08281355800-e1.jpg?ts=1706093265803&w=850',
        category: Category.coats,
        gender: Gender.man,
        sizes: ['39', '40', '41', '42', '43', '44']),
    Product(
        id: 2,
        title: "Basic Slim Fit T-Shirt",
        description: "Dua Dua my Dua lipa!",
        price: 100,
        imagePath:
            'https://static.zara.net/assets/public/c334/7262/b6c64a7da540/3b251ea8639b/05584361250-e1/05584361250-e1.jpg?ts=1701795761728&w=850',
        category: Category.shirts,
        gender: Gender.man,
        sizes: ['39', '40', '41', '42', '43', '44']),
    Product(
        id: 3,
        title: "BASIC MEDIUM WEIGHT T-SHIRT",
        description:
            "Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!Dua Dua my Dua lipa!",
        price: 9.99,
        imagePath: 'https://static.zara.net/assets/public/6fe7/9b7c/a8264d6d81ee/abc8f8100037/01887470800-e1/01887470800-e1.jpg?ts=1703084878835&w=850',
        category: Category.shirts,
        gender: Gender.man,
        sizes: ['39', '40', '41', '42', '43', '44']),
    Product(
        id: 4,
        title: "QUARTER-ZIP SWEATSHIRT",
        description: "Long sleeve quarter-zip sweatshirt. Ribbed trims.",
        price: 49.99,
        imagePath:
            'https://static.zara.net/assets/public/ab3c/0d8c/5ee746fea91a/159369bcf023/06462410800-e1/06462410800-e1.jpg?ts=1699950969253&w=850',
        category: Category.hoodies,
        gender: Gender.man,
        sizes: ['39', '40', '41', '42', '43', '44']),
    Product(
        id: 5,
        title: "SHORT SLEEVE INTERLOCK T-SHIRT",
        description:
            "T-shirt made of stretchy and flexible knit fabric with a compact, soft and opaque weave.",
        price: 24.95,
        imagePath: 'https://static.zara.net/assets/public/19ed/db69/3cd849afb8ac/d9f182c9f4f6/04174178629-e1/04174178629-e1.jpg?ts=1713257032622&w=850',
        category: Category.shirts,
        gender: Gender.woman,
        sizes: ['39', '40', '41', '42', '43', '44']),
    Product(
        id: 6,
        title: "COTTON T-SHIRT WITH ENZYME FINISH",
        description:
            "T-shirt made of cotton yarn with enzyme finish. Round collar and short sleeves.",
        price: 19.90,
        imagePath: 'https://static.zara.net/assets/public/50e6/571a/c6bd45de9da1/7a0ac3bb8204/04424151104-e1/04424151104-e1.jpg?ts=1707930612767&w=850',
        category: Category.shirts,
        gender: Gender.woman,
        sizes: ['39', '40', '41', '42', '43', '44']),
  ];

  List<Product> getAllProducts() {
    return _products;
  }

  List<Product> getProductsByGender(Gender gender) {
    if (gender == Gender.all) {
      return _products;
    }
    return _products.where((element) => element.gender == gender).toList();
  }

  List<Product> getProductsByCategory(Category category) {
    return _products.where((element) => element.category == category).toList();
  }
}
