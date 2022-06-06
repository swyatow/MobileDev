import 'package:flutter/material.dart';
import 'package:nav_from_pp/twopage.dart';

void main() {
  runApp(MaterialApp(
    home: const MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Главная страница',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              User user = User(name: 'Константин', age: 38);
              Route route =
                  MaterialPageRoute(builder: (context) => TwoPage(user: user));
              Navigator.push(context, route);
            },
            child: Text('2-ая страница'),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
