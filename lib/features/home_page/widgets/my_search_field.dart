import 'package:flutter/material.dart';
// import 'package:shop_app/features/favorites_page/favorites_screen.dart';

class MySearchField extends StatelessWidget {
  MySearchField({super.key, required this.readOnly, this.onTap});

  final bool readOnly;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: readOnly,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(16)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
