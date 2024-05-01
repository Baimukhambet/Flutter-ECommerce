import 'package:flutter/material.dart';
import 'package:shop_app/features/profile_page/widgets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('General'),
        SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => const ProfileTile(
                    icon: Icon(Icons.person),
                    title: "Account details",
                    description: "Edit your account information",
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 4),
        )
      ]),
    );
  }
}
