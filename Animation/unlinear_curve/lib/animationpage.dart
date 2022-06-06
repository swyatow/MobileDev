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
  late Animation<double> curve;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    curve = Tween(begin: 0.5, end: 2.0)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.ease));
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
      animation: curve,
      builder: (context, child) {
        return Transform.scale(
          child: MyContainer(),
          scale: curve.value,
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
      color: Colors.amber,
      height: 100,
      width: 100,
    );
  }
}
