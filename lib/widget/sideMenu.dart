import 'package:arrived/pages/arrived.dart';
import 'package:arrived/services/navigator_service.dart';
import 'package:arrived/pages/send_message_now.dart';
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
            onTap: () {
              AppNavigator().pop(context);
              AppNavigator().push(context, Arrived());
            },
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.phone_disabled_outlined),
            title: const Text("הודעה בלי להוסיף לאנשי קשר "),
            onTap: () {
              AppNavigator().pop(context);
              AppNavigator().push(context, SendMessageNow());
            },
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
