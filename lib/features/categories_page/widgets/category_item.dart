import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {super.key, required this.title, required this.imageUrl, this.onTap});

  final String title;
  final String imageUrl;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          // height: 120,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xE6E6E6FF)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imageUrl,
                      height: 100, width: 100, fit: BoxFit.cover)),
              const SizedBox(width: 16),
              Text(title, style: Theme.of(context).textTheme.headlineMedium)
            ],
          )),
    );
  }
}
