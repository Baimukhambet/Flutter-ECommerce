class Category {
  final String name;

  Category({required this.name});
}

enum MainCategory { all, woman, man, kid }

extension ParseToString on MainCategory {
  String toStr() {
    String str = this.name;
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }
}
