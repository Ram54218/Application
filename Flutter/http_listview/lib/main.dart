import 'package:flutter/material.dart';
import 'package:my_flutter/pages/national_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NationalPage(),//create a homepage
    );
  }
}
