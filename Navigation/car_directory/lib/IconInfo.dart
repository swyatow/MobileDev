import 'package:flutter/material.dart';
import 'package:car_directory/main.dart';

class IconCard extends StatefulWidget {
  late String IconArticle;
  late String IconPath;
  late int IconValue;

  IconCard({
    Key? key,
    required this.IconArticle,
    required this.IconPath,
    required this.IconValue,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IconCardState(
      iconArticle: IconArticle,
      iconPath: IconPath,
      iconValue: IconValue,
    );
  }
}

class IconCardState extends State<IconCard> {
  late String iconArticle;
  late String iconPath;
  late int iconValue;
  IconCardState({
    required this.iconArticle,
    required this.iconPath,
    required this.iconValue,
  });

  @override
  Widget build(BuildContext context) {
    String stringForPlaces =
        iconArticle == 'Места' ? '$iconValue' : '$iconValue мм';
    return Column(
      children: [
        //Ширина
        Text(iconArticle),
        Image.asset(
          iconPath,
          //'img/width.png',
          width: 50,
          height: 50,
        ),
        Text(stringForPlaces)
      ],
    );
  }
}
