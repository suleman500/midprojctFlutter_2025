import 'package:flutter/material.dart';
import 'package:orojct/GoodFood/Widgte/costomCart.dart';
import '../modle/modelProdactFood.dart';

class Shoing extends StatelessWidget {
  Modelproductfood? productFood;
  List<Modelproductfood> cart = [];

  Shoing({required this.cart, this.productFood});

  @override
  Widget build(BuildContext context) {
    return cart.isEmpty ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shop, size: 150, color: Colors.black26),
        Text(
          "is Empty Cart",
          style: TextStyle(fontSize: 50, color: Colors.black38),
        ),
      ],
    ) : Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 80,
              child: Text(
                "${calculetSumm(cart)}",
                style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) => Costomcart(cartFood: cart[index]),
          ),
        ),
      ],
    );
  }

  double calculetSumm(List<Modelproductfood> cart) {
    double sum = 0;
    cart.forEach((e) {
      sum += e.price;
    });
    return sum;
  }
}