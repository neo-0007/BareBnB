import 'package:flutter/material.dart';

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.subtext,
  });

  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final String? subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon),
            title: Text(text),
            subtitle: subtext != null ? Text(subtext!) : null,
            trailing: Icon(Icons.navigate_next_sharp),
          ),
        ),
        Divider(
          color: const Color.fromARGB(62, 158, 158, 158),
        )
      ],
    );
  }
}
