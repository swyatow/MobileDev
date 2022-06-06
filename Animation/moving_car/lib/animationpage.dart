import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Машина')),
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
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    animation =
        Tween(begin: 0.0, end: window.physicalSize.width).animate(controller);
    animation.addListener(() {
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
        child: new Stack(
      children: <Widget>[
        new Positioned(
            child: Container(
              child: Image.asset('car.png'),
              height: 40,
              width: 100,
            ),
            left: animation.value - 80,
            top: 100.0)
      ],
      textDirection: TextDirection.ltr,
    ));
  }
}
