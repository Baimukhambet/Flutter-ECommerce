import 'package:flutter/material.dart';
// import 'package:shop_app/features/favorites_page/favorites_screen.dart';

class MySearchField extends StatelessWidget {
  MySearchField({super.key, required this.readOnly, this.onTap});

  final bool readOnly;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(16),
      child: TextField(
        onTap: onTap,
        readOnly: readOnly,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
