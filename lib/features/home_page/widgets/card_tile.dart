import 'package:flutter/material.dart';
import 'package:shop_app/repositories/models/models.dart';

class CardTile extends StatelessWidget {
  CardTile({super.key, required this.product, required this.onTap});

  final Product product;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imagePath,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.favorite, color: Colors.white)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: theme.textTheme.titleSmall,
                                maxLines: 1,
                                // softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                              Text("\$${product.price}",
                                  style: theme.textTheme.titleSmall),
                            ],
                          ),
                        ),
                        const Icon(Icons.shopping_bag_rounded,
                            color: Colors.white)
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
