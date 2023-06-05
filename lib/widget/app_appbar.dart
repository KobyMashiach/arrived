import 'package:flutter/material.dart';

AppBar appAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 42, 173, 28),
    title: Image.asset(
      'assets/logo.png',
      width: 70,
      height: 70,
    ),
    centerTitle: true,
    toolbarHeight: 70,
    elevation: 20,
    shadowColor: const Color.fromARGB(255, 60, 255, 0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
  );
}
