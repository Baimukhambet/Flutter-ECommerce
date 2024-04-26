import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/product_page/widgets/size_tile.dart';
import 'package:shop_app/repositories/models/models.dart';
import 'package:shop_app/repositories/providers/cart_provider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedSizeIndex = 0;

  void _changeSizeIndex(int index) {
    setState(() {
      selectedSizeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<CartProvider>(context);
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
                          child: Image.network(widget.product.imagePath,
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
                        Text(widget.product.title,
                            style: theme.textTheme.headlineLarge),
                        const SizedBox(height: 12),
                        //price
                        Text('\$${widget.product.price}',
                            style: theme.textTheme.headlineMedium),
                        const SizedBox(height: 12),
                        //description
                        Text(
                          widget.product.description,
                          style: theme.textTheme.bodySmall,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 40),
                        //size
                        Text('Size', style: theme.textTheme.titleMedium),

                        const SizedBox(
                          height: 10,
                        ),
                        //size row
                        Container(
                          height: 50,
                          child: ListView.builder(
                              // shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.product.sizes.length,
                              itemBuilder: (context, index) {
                                final isSelected = selectedSizeIndex == index;
                                return SizeTile(
                                  size: widget.product.sizes[index],
                                  isSelected: isSelected,
                                  onTap: () => _changeSizeIndex(index),
                                );
                              }),
                        ),
                      ]),

                  //button
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.addToCart(widget.product);
                        },
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
