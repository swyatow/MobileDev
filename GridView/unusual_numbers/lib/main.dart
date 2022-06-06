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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Неповторяющиеся числа'),
          centerTitle: true,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: 200,
            itemBuilder: ((context, index) {
              if (index.isOdd) return new Divider();
              final int i = index ~/ 2;
              return ListTile(title: Text(nums[i].toString()));
            }),
          ),
        ),
      ),
    );
  }

  static CreateNums() {
    var rnd = new Random();
    List<int> num = [];
    for (int i = 1; i < 101; i++) {
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
