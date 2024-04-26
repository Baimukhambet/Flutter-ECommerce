import 'package:flutter/material.dart';

class SizeTile extends StatelessWidget {
  SizeTile(
      {super.key,
      required this.size,
      required this.isSelected,
      required this.onTap});

  final String size;
  bool isSelected = false;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: isSelected ? Colors.black : Color(0xF2F2F2FF),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(size,
                style: TextStyle(
                    color: isSelected ? Colors.white : Color(0x404040FF)))),
      ),
    );
  }
}
