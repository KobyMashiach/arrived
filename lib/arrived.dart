import 'package:arrived/app_appbar.dart';
import 'package:arrived/sideMenu.dart';
import 'package:flutter/material.dart';

class Arrived extends StatefulWidget {
  const Arrived({super.key});

  @override
  State<Arrived> createState() => _ArrivedState();
}

class _ArrivedState extends State<Arrived> {
  final phoneNumberController = TextEditingController();
  final messageController = TextEditingController();
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      drawer: const SideMenu(),
      body: SafeArea(
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.phone), hintText: "מספר טלפון"),
              ),
              const SizedBox(height: 30),
              TextField(
                maxLines: null,
                controller: messageController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.message), hintText: "הודעה"),
              ),
              const SizedBox(height: 30),
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text("שלח"),
                icon: Icon(Icons.send),
              )
            ],
          ),
        ),
      )),
    );
  }
}
