import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});
  final Icon icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            icon,
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(description, style: TextStyle(fontSize: 12)),
              ],
            )
          ],
        ));
  }
}
