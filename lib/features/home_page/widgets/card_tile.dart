import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/repositories/models/models.dart';

class CardTile extends StatefulWidget {
  CardTile(
      {super.key,
      required this.product,
      required this.onTap,
      this.onBagTap,
      required this.onHeartTap,
      required this.isFavorite,
      required this.isInCart});

  final Product product;
  void Function()? onTap;
  void Function()? onBagTap;
  void Function()? onHeartTap;
  final bool isFavorite;
  final bool isInCart;

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.product.imagePath,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: widget.onHeartTap,
                          child: Icon(Icons.favorite,
                              color: widget.isFavorite
                                  ? Colors.red[700]
                                  : Colors.black),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                style: theme.textTheme.titleSmall,
                                maxLines: 1,
                                // softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              Text("\$${widget.product.price}",
                                  style: theme.textTheme.titleSmall),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onBagTap,
                          child: Icon(Icons.shopping_bag_rounded,
                              color: widget.isInCart
                                  ? Color.fromARGB(255, 67, 91, 227)
                                  : Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
