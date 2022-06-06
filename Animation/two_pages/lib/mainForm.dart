import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firstAnimPage.dart';
import 'secAnimPage.dart';

class MainFormPage extends StatefulWidget {
  const MainFormPage({Key? key}) : super(key: key);

  @override
  State<MainFormPage> createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выберите анимацию'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Поэтапная анимация'),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => FirstAnimPage());
                Navigator.push(context, route);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text('Одновременная анимация'),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => SecondAnimPage());
                Navigator.push(context, route);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
