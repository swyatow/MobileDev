import 'package:car_directory/CarCard.dart';
import 'package:car_directory/main.dart';
import 'package:car_directory/IconInfo.dart';
import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarPageState();
  }
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    //Получение данных
    final car = ModalRoute.of(context)!.settings.arguments as List;

    //Передача обратно
    //Button => onpressed: () {Navigator.of(context).pop(result);}

    return Scaffold(
      appBar: AppBar(
        title: Text(car[0]),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Image.asset('img/bg2.jpg', fit: BoxFit.fill),
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconCard(
                          IconArticle: 'Ширина',
                          IconPath: 'img/width.png',
                          IconValue: car[1],
                        ),
                        SizedBox(width: 20),
                        IconCard(
                          IconArticle: 'Высота',
                          IconPath: 'img/height.png',
                          IconValue: car[2],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconCard(
                          IconArticle: 'Длина',
                          IconPath: 'img/length.png',
                          IconValue: car[3],
                        ),
                        SizedBox(width: 20),
                        IconCard(
                          IconArticle: 'Клиренс',
                          IconPath: 'img/clirens.png',
                          IconValue: car[4],
                        ),
                      ],
                    ),
                  ],
                ),
                IconCard(
                  IconArticle: 'Места',
                  IconPath: 'img/count_places.png',
                  IconValue: car[5],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
