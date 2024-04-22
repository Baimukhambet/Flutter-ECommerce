import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardTile extends StatelessWidget {
  CardTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://www.rollingstone.com/wp-content/uploads/2022/08/dua-lipa.jpg?w=1600&h=900&crop=1',
                height: double.infinity,
                // width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dua Lipa", style: theme.textTheme.titleMedium),
                          Text("\$100", style: theme.textTheme.titleMedium),
                        ],
                      ),
                      Icon(Icons.shopping_bag_rounded, color: Colors.white)
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
