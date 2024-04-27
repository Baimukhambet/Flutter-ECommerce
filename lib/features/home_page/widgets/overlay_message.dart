import 'package:flutter/material.dart';

class OverlayMessage extends StatelessWidget {
  const OverlayMessage({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(16)),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          )),
    );
  }
}
