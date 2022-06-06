import 'dart:html';
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
  List<String> text = CreateList();
  var rnd = new Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView Нули и единицы'),
          centerTitle: true,
        ),
        body: Center(
          child: GridView.builder(
            itemCount: 25,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext cnxt, index) {
              return Container(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    text[index],
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      text[index] == "0"
                          ? text[index] = "1"
                          : text[index] = "0";
                    });
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.cyan[100],
                  borderRadius: BorderRadius.circular(500),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static List<String> CreateList() {
    var rnd = new Random();
    List<String> list = [];
    for (int i = 0; i < 50; i++) {
      list.add(rnd.nextInt(2).toString());
    }
    return list;
  }
}
