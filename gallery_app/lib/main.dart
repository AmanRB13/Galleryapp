import 'package:flutter/material.dart';
import 'bottomnav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery App ',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.greenAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}
