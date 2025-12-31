import 'package:flutter/material.dart';

import '../modle/modelProdactFood.dart';
class Costomcart extends StatelessWidget {
  Modelproductfood cartFood;
  Costomcart({required this.cartFood});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Card(
        child: Container(
          width: 80,
          height: 100,
          color: Colors.black12,
          child:ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: Image.asset(cartFood.namePhoto),


            ),

            title: Text(cartFood.title),
            subtitle: Text(cartFood.subTitle),
            trailing: Text("Price: ${cartFood.price.toString()}"),
            

          ),),

      ),
    );
  }


}