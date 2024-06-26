import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/repositories/models/product_model.dart';

class CartItem extends StatelessWidget {
  CartItem(
      {super.key,
      required this.product,
      required this.count,
      required this.onIncrement,
      required this.onDecrement,
      required this.onRemove,
      required this.onTap});

  final Product product;
  int count;

  void Function() onIncrement;
  void Function() onDecrement;
  void Function() onRemove;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(100),
                    offset: Offset(0, 4),
                    blurRadius: 6)
              ]),
          margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            //img
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(product.imagePath))),

            const SizedBox(width: 10),

            //column

            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(product.title,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis))),
                      IconButton(
                          onPressed: onRemove, icon: const Icon(Icons.close))
                    ],
                  ),
                  const Text('Color/  |  Size/'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: onDecrement,
                          icon: const Icon(Icons.remove_circle_outline)),
                      Text("$count"),
                      IconButton(
                          onPressed: onIncrement,
                          icon: const Icon(Icons.add_circle_outline))
                    ],
                  ),
                  Text('\$${(product.price * count).toStringAsFixed(2)}')
                ],
              ),
            )
          ])),
    );
  }
}
