import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сердцебиение')),
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
      duration: Duration(milliseconds: 500),
    );
    rotation = Tween(begin: 0.5, end: 0.55).animate(controller);

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
    controller.repeat(reverse: true);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: rotation.value,
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
      child: Image.asset('heart.png'),
      width: 200,
      height: 200,
    );
  }
}
