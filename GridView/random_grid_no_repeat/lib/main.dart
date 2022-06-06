import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<int> nums = CreateNums();
  var rnd = new Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView без повторов'),
          centerTitle: true,
        ),
        body: Center(
          child: GridView.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 5 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext cnxt, index) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  nums[index].toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static CreateNums() {
    var rnd = new Random();
    List<int> num = [];
    for (int i = 1; i < 51; i++) {
      num.add(i);
    }
    List<int> rndNums = [];
    while (num.length > 0) {
      var selectedIndex = rnd.nextInt(num.length);
      rndNums.add(num[selectedIndex]);
      num.removeAt(selectedIndex);
    }
    return rndNums;
  }
}
