import 'package:flutter/material.dart';

import '../Style/DecrionStayle.dart';
import '../modle/modelProdactFood.dart';

class Costomfood extends StatelessWidget {


  Modelproductfood food;
  Costomfood({
    required this.food,


  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
     // color: Colors.black12,
      //decoration: Decrionstayle.styleDecion,
      child: Column(
        children: [
          Expanded(
            child: Container(

              child: Image.asset(food.namePhoto),
            ),
          ),
          Expanded(
            child: ListTile(title: Text(food.title)
              ,subtitle: Text(food.subTitle),

            ),
          ),
          
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
              Positioned(
                  right: 1,
                  bottom: -1,
                  //right: 6,
                  child: Icon(Icons.favorite_border))

            ],),
          )
        ],
      ),
    );
  }
}
