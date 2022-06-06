import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Анимация')),
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
  late Animation<double> rotation;

  @override
  void initState() {
    controller = AnimationController(
      lowerBound: 1,
      upperBound: 4,
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    rotation = Tween(begin: 0.0, end: 4 * Math.pi).animate(controller);

    controller.addListener(() {
      print(controller.status);
      print(rotation.value);
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
    controller.repeat(min: 2, max: 3, reverse: true);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: rotation.value,
          child: MyContainer(),
        );
      },
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Это контейнер!'),
      width: 150,
      height: 150,
      decoration: BoxDecoration(color: Colors.lime[200]),
    );
  }
}
