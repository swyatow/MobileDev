import 'package:flutter/material.dart';
import 'regForm.dart';
import 'user.dart';

class infoPage extends StatefulWidget {
  late User user;
  late Map<String, bool> animals;

  infoPage({Key? key, required User user, required Map<String, bool> animals})
      : super(key: key) {
    this.user = user;
    this.animals = animals;
  }

  @override
  State<infoPage> createState() => _infoPageState(animals: animals, user: user);
}

class _infoPageState extends State<infoPage> {
  late User user;
  late Map<String, bool> animals;

  _infoPageState({required User user, required Map<String, bool> animals}) {
    this.user = user;
    this.animals = animals;
  }

  @override
  Widget build(BuildContext context) {
    int zp = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Результат'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Имя: ${user.name}'),
            SizedBox(height: 20),
            Text('Телефон: ${GetPhone()}'),
            SizedBox(height: 20),
            Text(
                'На ваш Email (${user.email})\nбыло отправлено письмо с приглашением на работу'),
            SizedBox(height: 20),
            Text('Вы будете ухаживать за ${GetAnimals()}'),
            SizedBox(height: 20),
            Text('Оплата Вашего труда составит: ${GetZP()}'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  String GetPhone() {
    if (user.phone == null)
      return "Отсутствует";
    else
      return user.phone!;
  }

  String GetAnimals() {
    String str = "";
    for (var anim in animals.keys) {
      if (animals[anim]!) {
        str += anim;
        str += ', ';
      }
    }
    if (!str.isEmpty) str.replaceRange(str.length - 2, null, "");
    return str;
  }

  String GetZP() {
    num zp = user.age * 3000;
    if (user.gender == Gender.female) zp *= 1.35;
    return zp.toString();
  }
}
