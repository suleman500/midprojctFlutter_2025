import 'package:flutter/material.dart';

import '../Style/DecrionStayle.dart';
import '../modle/modelProdactFood.dart';

class Costomfood extends StatelessWidget {


  Modelproductfood food;
  IconData isVf=Icons.favorite_border;
  bool ?chik;
  VoidCallback? onTap;
  VoidCallback? onTapCard;

  Costomfood({
    required this.food,
    //this.isVf,
     this.onTap
    ,
    this.chik,

required this.onTapCard
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
onTap:onTapCard ,

      child: Card(
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
                    child: InkWell(
                        onTap:  onTap,
                        child:Icon(food.isFav ?Icons.favorite_outlined:Icons.favorite_border))),

              ],),
            )
          ],
        ),
      ),
    );
  }
}
