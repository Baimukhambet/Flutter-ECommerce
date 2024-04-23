import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile(
      {super.key, required this.title, required this.isActive, this.onTap});

  final String title;
  final bool isActive;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive ? Colors.black : Color(0xFAFAFBFF),
          border: Border.all(color: Color(0xE6E6E6FF)),
        ),
        child: Center(
            child: Text(title,
                style: TextStyle(
                  color: isActive
                      ? Color(0xFAFAFBFF)
                      : Color.fromRGBO(160, 160, 160, 1.0),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ))),
      ),
    );
  }
}
