import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/repositories/models/models.dart';

class CardTile extends StatefulWidget {
  CardTile(
      {super.key, required this.product, required this.onTap, this.onBagTap});

  final Product product;
  void Function()? onTap;
  void Function()? onBagTap;

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  bool isFavorite = false;

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
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Icon(Icons.favorite,
                              color: isFavorite ? Colors.red : Colors.white),
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
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              Text("\$${widget.product.price}",
                                  style: theme.textTheme.titleSmall),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onBagTap,
                          child: const Icon(Icons.shopping_bag_rounded,
                              color: Colors.white),
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
