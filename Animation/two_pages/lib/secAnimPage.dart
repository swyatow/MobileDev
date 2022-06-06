import 'package:flutter/material.dart';
import 'mainForm.dart';
import 'dart:math' as Math;

class SecondAnimPage extends StatefulWidget {
  SecondAnimPage({Key? key}) : super(key: key);

  @override
  State<SecondAnimPage> createState() => _secAnimPageState();
}

class _secAnimPageState extends State<SecondAnimPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;

  int animCount = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    rotation = Tween(begin: 0.0, end: 4 * Math.pi).animate(controller);
    opacity = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        setState(() {
          animCount++;
        });
        controller.reset();
        if (animCount < 5) {
          controller.forward();
        } else {
          controller.reset();
        }
      }
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
    bool isAnimated = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Одновременная анимация'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              animCount == 0
                  ? "Анимация еще не проигрывалась\nни одного раза!"
                  : "Количество завершенных\nциклов анимации: ${animCount}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              child: Text("Пуск"),
              onPressed: () {
                setState(() {
                  controller.reset();
                  animCount = 0;
                  controller.forward();
                });
              },
            ),
            SizedBox(height: 250),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: rotation.value,
                  child: Opacity(
                    opacity: opacity.value,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(color: Colors.orange),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
