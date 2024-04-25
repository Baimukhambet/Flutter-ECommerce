enum Gender { all, woman, man }

enum Category {
  shirts,
  jeans,
  coats,
  hoodies,
  shoes;
}

extension ToStringGender on Gender {
  String toStr() {
    String str = this.name;
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }
}

extension ToStringCategory on Category {
  String toStr() {
    String str = this.name;
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }
}


// 1. Gender 2. Adult/Kid 3. Catgory of cloth

// Every