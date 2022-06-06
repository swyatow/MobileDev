import 'package:flutter/material.dart';
import 'package:car_directory/twopage.dart';
import 'package:car_directory/carcard.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    title: 'Справочник автомобилей',
    debugShowCheckedModeBanner: false,
    home: const MainPage(),
    routes: {
      '/page2': (context) => CarPage(),
    },
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // Получение данных с дочерней формы
    // Описать переменную такого же типа, что и вернули, затем через setState(() {async - метод!}) поменять на полученное значение

    return Scaffold(
      appBar: AppBar(
        title: Text('Справочник автомобилей'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Image.asset('img/bg1.jpg', fit: BoxFit.fill),
            ListView(
              children: [
                CarCard(
                  CarName: 'Honda MX-10',
                  LogoPath: 'img/honda_logo.png',
                  Length: 4882,
                  Height: 1452,
                  Width: 1862,
                  Clirens: 200,
                  CountOfPlaces: 5,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'BMW M',
                  LogoPath: 'img/bmw_logo.png',
                  Length: 5621,
                  Height: 1625,
                  Width: 1496,
                  Clirens: 156,
                  CountOfPlaces: 5,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Mazda CX-5',
                  LogoPath: 'img/mazda_logo.png',
                  Length: 4231,
                  Height: 1653,
                  Width: 1485,
                  Clirens: 235,
                  CountOfPlaces: 5,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Mitsubishi Doto',
                  LogoPath: 'img/mitsubishi_logo.png',
                  Length: 8564,
                  Height: 2630,
                  Width: 2354,
                  Clirens: 285,
                  CountOfPlaces: 8,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
                Divider(color: Colors.transparent, height: 7),
                CarCard(
                  CarName: 'Opel Corsa 3',
                  LogoPath: 'img/opel_logo.png',
                  Length: 4875,
                  Height: 1423,
                  Width: 1426,
                  Clirens: 135,
                  CountOfPlaces: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
