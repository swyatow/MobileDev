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
  List<String> first = CreateNumsList();
  List<String> second = CreateNumsList();
  List<String> pl_or_min = CreateList();
  List<String> result = CreateResultList();
  List<bool> bools = CreateBoolList();
  var rnd = new Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView Примеры'),
          centerTitle: true,
        ),
        body: Center(
          child: GridView.builder(
            itemCount: 25,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 5 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext cxt, index) {
              return Container(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    first[index] +
                        pl_or_min[index] +
                        second[index] +
                        result[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (bools[index]) {
                        int res = pl_or_min[index] == "+"
                            ? int.parse(first[index]) + int.parse(second[index])
                            : int.parse(first[index]) -
                                int.parse(second[index]);
                        result[index] += res.toString();
                        bools[index] = false;
                      }
                    });
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.cyan[100],
                  borderRadius: BorderRadius.circular(5),
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
      if (rnd.nextBool())
        list.add("+");
      else
        list.add("-");
    }
    return list;
  }

  static List<String> CreateNumsList() {
    var rnd = new Random();
    List<String> list = [];
    for (int i = 0; i < 50; i++) {
      while (true) {
        var temp = rnd.nextInt(50);
        if (temp > 10) {
          list.add(temp.toString());
          break;
        }
      }
    }
    return list;
  }

  static List<String> CreateResultList() {
    List<String> list = [];
    for (int i = 0; i < 50; i++) {
      list.add("=");
    }
    return list;
  }

  static List<bool> CreateBoolList() {
    List<bool> list = [];
    for (int i = 0; i < 50; i++) {
      list.add(true);
    }
    return list;
  }
}
