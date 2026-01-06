
import 'package:flutter/material.dart';
import 'dart:math';
class CommentModel {
  String personName;
  IconData personIcon;
  String comment;
  DateTime date;
  double rating;

  CommentModel({
    required this.personName,
    required this.personIcon,
    required this.comment,
    required this.date,
    this.rating = 0.0,
  });


}

Random random = Random();
double randomNumber =3.0+ random.nextDouble()*4.0;
double formattedNumber = double.parse(randomNumber.toStringAsFixed(2));


List<CommentModel> commentList = [
  CommentModel(
    personName: "Ahmed Mohamed",
    personIcon: Icons.person,
    comment: "Great product and price is suitable for the quality",
    date: DateTime(2024, 3, 15),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Sara Khaled",
    personIcon: Icons.person_outline,
    comment: "Fast delivery and the product works efficiently",
    date: DateTime(2024, 3, 14),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Ali Hassan",
    personIcon: Icons.account_circle,
    comment: "High quality but the price is a bit high",
    date: DateTime(2024, 3, 13),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Fatima Ali",
    personIcon: Icons.face,
    comment: "Excellent product, highly recommended",
    date: DateTime(2024, 3, 12),
    rating:formattedNumber,
  ),
  CommentModel(
    personName: "Mohamed Abdullah",
    personIcon: Icons.person_pin,
    comment: "Customer service was excellent",
    date: DateTime(2024, 3, 11),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Nora Saeed",
    personIcon: Icons.supervised_user_circle,
    comment: "Good packaging and the product is safe",
    date: DateTime(2024, 3, 10),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Khaled Rashid",
    personIcon: Icons.person_add,
    comment: "The product is suitable for daily use",
    date: DateTime(2024, 3, 9),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Latifa Salem",
    personIcon: Icons.perm_identity,
    comment: "Product performance exceeded expectations",
    date: DateTime(2024, 3, 8),
    rating:formattedNumber,
  ),
  CommentModel(
    personName: "Rashid Nasser",
    personIcon: Icons.account_box,
    comment: "Reasonable price and good quality",
    date: DateTime(2024, 3, 7),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Mariam Abdulrahman",
    personIcon: Icons.person_outlined,
    comment: "Practical and easy to use product",
    date: DateTime(2024, 3, 6),
    rating: formattedNumber,
  ),
  CommentModel(
    personName: "Salem Ahmed",
    personIcon: Icons.people,
    comment: "I recommend everyone to buy this product",
    date: DateTime(2024, 3, 5),
    rating: formattedNumber,
  ),
];