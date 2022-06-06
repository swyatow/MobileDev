import 'package:flutter/material.dart';
import 'package:moving_car/animationpage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Анимация',
      home: AnimationPage(),
    );
  }
}
