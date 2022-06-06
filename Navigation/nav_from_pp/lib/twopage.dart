import 'package:nav_from_pp/main.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  final User user;

  TwoPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} - ${user.age}'),
        centerTitle: true,
      ),
      body: MainPageTwo(user: user),
    );
  }
}

class MainPageTwo extends StatelessWidget {
  final User user;

  const MainPageTwo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '2-ая страница',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '${user.name} - ${user.age}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Вернуться'),
          )
        ],
      ),
    );
  }
}
