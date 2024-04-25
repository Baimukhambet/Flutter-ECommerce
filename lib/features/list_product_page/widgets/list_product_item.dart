import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/repositories/models/models.dart';

class ListProductItem extends StatelessWidget {
  const ListProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          // flex: 10,
          Image.network(
            product.imagePath,
            fit: BoxFit.cover,
          ),
          Text(product.title),
        ]));
  }
}
