import 'package:flutter/material.dart';
import 'package:temp_practice/screens/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: HomePage(),
  ));
}
