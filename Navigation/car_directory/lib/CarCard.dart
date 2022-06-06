import 'package:flutter/material.dart';
import 'package:car_directory/main.dart';

class CarCard extends StatefulWidget {
  late String CarName;
  late String LogoPath;
  late int Length;
  late int Width;
  late int Height;
  late int Clirens;
  late int CountOfPlaces;

  CarCard({
    Key? key,
    required this.CarName,
    required this.LogoPath,
    required this.Length,
    required this.Width,
    required this.Height,
    required this.Clirens,
    required this.CountOfPlaces,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CarCardState(
      carName: CarName,
      logoPath: LogoPath,
      length: Length,
      width: Width,
      height: Height,
      clirens: Clirens,
      countOfPlaces: CountOfPlaces,
    );
  }
}

class CarCardState extends State<CarCard> {
  late String carName;
  late String logoPath;
  late int length;
  late int width;
  late int height;
  late int clirens;
  late int countOfPlaces;
  CarCardState({
    required this.carName,
    required this.logoPath,
    required this.length,
    required this.width,
    required this.height,
    required this.clirens,
    required this.countOfPlaces,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(logoPath),
      title: Text(
        carName,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(Icons.arrow_right_alt),
      onTap: () {
        Navigator.pushNamed(context, '/page2', arguments: [
          carName,
          width,
          height,
          length,
          clirens,
          countOfPlaces
        ]);
      },
    );
  }
}
