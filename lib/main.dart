import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Minimal To Do',
    theme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.amber,
      useMaterial3: true,
    ),
    home: const Home(),
  ));
}
