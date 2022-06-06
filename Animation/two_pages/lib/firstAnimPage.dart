import 'package:flutter/material.dart';
import 'mainForm.dart';
import 'dart:math' as Math;

class FirstAnimPage extends StatefulWidget {
  FirstAnimPage({Key? key}) : super(key: key);

  @override
  State<FirstAnimPage> createState() => _firstAnimPageState();
}

class _firstAnimPageState extends State<FirstAnimPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> moveDown;
  late Animation<double> scale;

  late Animation<BorderRadius?> borderRadius;
  late Animation<Color?> color;

  int animCount = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    rotation = Tween(begin: 0.0, end: 4 * Math.pi).animate(controller);
    opacity = Tween(begin: 0.1, end: 1.0).animate(controller);
    moveDown = Tween(begin: 50.0, end: 300.0).animate(controller);
    scale = Tween(begin: 0.0, end: 1.0).animate(controller);

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

    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.indigo[100],
      end: Colors.red[500],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.75,
          curve: Curves.ease,
        ),
      ),
    );
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
        title: Text('Поэтапная анимация'),
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
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, moveDown.value),
                  child: Opacity(
                    opacity: opacity.value,
                    child: Transform.scale(
                      scale: scale.value,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: color.value,
                          borderRadius: borderRadius.value,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 3.0,
                          ),
                        ),
                      ),
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
