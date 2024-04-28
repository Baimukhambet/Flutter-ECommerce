import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/repositories/models/product_model.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem(
      {super.key,
      required this.product,
      required this.onTap,
      required this.onIconTap});

  final Product product;

  void Function() onTap;
  void Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          // height: 200,
          // width: 200,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    Text('\$${product.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                  onTap: onIconTap, child: const Icon(Icons.favorite)),
            ],
          )),
    );
  }
}
