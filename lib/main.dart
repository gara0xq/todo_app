import 'package:flutter/material.dart';
import 'package:todo_app/home_screen.dart';

void main() {
  runApp(MyApp());
}
//aasss
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
