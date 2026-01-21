import 'package:flutter/material.dart';
import 'package:sample/pages/Quiz_list_Page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizListPage(),
    );
  }
}
