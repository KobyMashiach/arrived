import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Wrap(
        runSpacing: -5,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("בית"),
            onTap: () {},
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("מועדפים"),
            onTap: () {},
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.contact_support_outlined),
            title: const Text("צריך עזרה?"),
            onTap: () {},
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("הגדרות"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
