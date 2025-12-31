import 'package:flutter/material.dart';

import '../modle/modelProdactFood.dart';


class DetealiSscrin extends StatelessWidget {
  Modelproductfood food;
  List <Modelproductfood> cart;

  DetealiSscrin({required this.food,required this.cart});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: AppBar(),


      body: SingleChildScrollView(
        child: Column(
           children: [
        

                Container(
        
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height*0.50,
                   child: Image.asset(food.namePhoto)),

        
        

           ListTile(title: Text(food.title,
        
          ),
            subtitle: Text(food.subTitle),
             leading: CircleAvatar(radius: 30,child: InkWell(
               
               child: InkWell(onTap: () {
                 cart.add(food);
                 print("kijj");

               },child: Icon(Icons.add_shopping_cart)),
             ),),
        
        
        
        
          ),

              Container(width: 60,height: 60,
              color: Colors.red,
               // child: Text("${food.price}"),
                child: Center(child: Text("50",style: TextStyle(fontSize: 30),)),
              ),

              Text(food.description,style: TextStyle(fontSize: 40),)
        
        
           ],
        
        
        ),
      ),

    );
  }


}