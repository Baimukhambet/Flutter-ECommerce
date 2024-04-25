import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/repositories/models/models.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Product Details', style: theme.textTheme.headlineLarge)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(product.imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity)))),
              const SizedBox(height: 26),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title,
                            style: theme.textTheme.headlineLarge),
                        const SizedBox(height: 12),
                        //price
                        Text('\$${product.price}',
                            style: theme.textTheme.headlineMedium),
                        const SizedBox(height: 12),
                        //description
                        Text(product.description,
                            style: theme.textTheme.bodySmall),
                        const SizedBox(height: 40),
                        //size
                        Text('Size', style: theme.textTheme.titleMedium),

                        //size row
                      ]),

                  //button
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 0,
                        ),
                        child: const Text('Add To Cart',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
