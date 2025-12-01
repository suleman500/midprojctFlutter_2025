import 'package:flutter/material.dart';

class Modelproductfood {
  String namePhoto;
  String title;
  String subTitle;

  Modelproductfood({
    required this.namePhoto,
    required this.title,
    required this.subTitle,
  });
}
List<Modelproductfood> foodList = [
  Modelproductfood(
    namePhoto: "food/piz.png",
    title: "Pizza Margherita",
    subTitle: "Classic Italian ",
  ),
  Modelproductfood(
    namePhoto: "food/burg.png",
    title: "Cheeseburger",
    subTitle: "Beef patty with cheese,",
  ),
  Modelproductfood(
    namePhoto: "food/Sald.jpeg",
    title: "Caesar Salad",
    subTitle: "Fresh romaine lettuce ",
  ),
  Modelproductfood(
    namePhoto: "food/Choc.png",
    title: "Chocolate Cake",
    subTitle: "Rich chocolate cake with",
  ),
];