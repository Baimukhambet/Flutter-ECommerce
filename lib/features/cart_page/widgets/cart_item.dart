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
      required this.onRemove});

  final Product product;
  int count;

  void Function() onIncrement;
  void Function() onDecrement;
  void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(100),
                  offset: Offset(0, 4),
                  blurRadius: 6)
            ]),
        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
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
                            style: TextStyle(overflow: TextOverflow.ellipsis))),
                    IconButton(onPressed: onRemove, icon: Icon(Icons.close))
                  ],
                ),
                Text('Color/  |  Size/'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: onDecrement,
                        icon: Icon(Icons.remove_circle_outline)),
                    Text("$count"),
                    IconButton(
                        onPressed: onIncrement,
                        icon: Icon(Icons.add_circle_outline))
                  ],
                ),
                Text('\$${product.price}')
              ],
            ),
          )
        ]));
  }
}
