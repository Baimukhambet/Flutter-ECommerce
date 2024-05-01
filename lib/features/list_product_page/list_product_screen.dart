import 'package:flutter/material.dart';
import 'package:shop_app/features/list_product_page/widgets/list_product_item.dart';
import 'package:shop_app/repositories/models/models.dart';
import 'package:shop_app/repositories/product_repository.dart';

class ListProductScreen extends StatefulWidget {
  ListProductScreen({super.key, required this.category});

  final Category category;

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  final ProductRepository _productRepository = ProductRepository.shared;
  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    products = _productRepository.getProductsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.toStr(),
              style: theme.textTheme.headlineLarge),
          scrolledUnderElevation: 0,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListProductItem(
              product: products[index],
            );
          },
        ));
  }
}
