import 'package:flutter/material.dart';

class Modelproductfood {
  final String namePhoto;
  final String title;
  final String subTitle;
  final bool isFav;
  final String description;
  final double price;
  final String catogory;

  Modelproductfood({
    required this.namePhoto,
    required this.title,
    required this.subTitle,
    required this.isFav,
    required this.description,
    required this.price,
    required this.catogory
  });

  Modelproductfood copyWith({
    String? namePhoto,
    String? title,
    String? subTitle,
    bool? isFav,
    String? description,
    double? price,
    String? catogory
  }) {
    return Modelproductfood(
        namePhoto: namePhoto ?? this.namePhoto,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        isFav: isFav ?? this.isFav,
        description: description ?? this.description,
        price: price ?? this.price,
        catogory: catogory ?? this.catogory
    );
  }
}

List<Modelproductfood> foodList = [
  Modelproductfood(
      namePhoto: "food/piz.png",
      title: "Pizza Margherita",
      subTitle: "Classic Italian",
      isFav: false,
      description: "Traditional Italian pizza with tomato sauce, mozzarella cheese, and fresh basil",
      price: 12.99,
      catogory: "Pizza"
  ),
  Modelproductfood(
      namePhoto: "food/burg.png",
      title: "Cheeseburger",
      subTitle: "Beef patty with cheese",
      isFav: false,
      description: "Beef burger with cheddar cheese, lettuce, tomato, and special sauce",
      price: 8.99,
      catogory: "Burger"
  ),
  Modelproductfood(
      namePhoto: "food/Sald.jpeg",
      title: "Caesar Salad",
      subTitle: "Fresh romaine lettuce",
      isFav: false,
      description: "Caesar salad with fresh romaine lettuce, croutons, and parmesan cheese",
      price: 7.50,
      catogory: "Salads"
  ),
  Modelproductfood(
      namePhoto: "food/Choc.png",
      title: "Chocolate Cake",
      subTitle: "Rich chocolate cake with",
      isFav: false,
      description: "Rich chocolate cake with chocolate cream layer and chocolate decorations",
      price: 5.99,
      catogory: "Desserts"
  ),
];