import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ракета')),
      body: Center(child: AnimationWidget()),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimationWidgetState();
}

class AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> curve;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    curve = Tween(begin: 0.0, end: 1000.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    curve.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.repeat();
    return Container(
        child: Stack(
      children: <Widget>[
        Positioned(
          child: Icon(Icons.rocket, size: 100),
          bottom: curve.value,
          left: 250,
        )
      ],
      textDirection: TextDirection.ltr,
    ));
  }
}
