import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/scriens/faviert.dart';
import 'package:orojct/fainalProjct/scriens/home_shop_game.dart';
import 'package:orojct/fainalProjct/scriens/shopping_cart.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';


class Firstpage extends StatefulWidget {
  List<ModelProduct> isfavert=GamesList.where((e) =>e.isFav==true ,).toList();

  String? emails;
  String? pass;

  String? firstName;
  String? lastName;
  double? balance;
  Dataloginandsingup? acoont;
  Firstpage({  this.emails,this.pass,this.firstName,this.lastName,this.balance, this.acoont});
  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  int selectindex=1;



   Map<String,IconData> iconAndString={
     'Faivert': Icons.favorite_outlined,
     'Home':Icons.home,
     'Shop': Icons.shopping_cart,

   };

  late List<Widget>namePage=[

    Faviert(),
    HomeShopGame(emails:widget.emails!,firstName:widget.firstName! ,lastName: widget.lastName!,pass: widget.pass!,balance: widget.balance,),
    ShoppingCart(),


  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
if(details.primaryVelocity!<0){
  if(selectindex<namePage.length-1){

    setState(() {
      selectindex++;
    });


  }


}
if(details.primaryVelocity!>0){
if(selectindex<=namePage.length-1&&selectindex>0){

  setState(() {
    selectindex--;
  });


}


}

      },
      child: Scaffold(
        body: namePage[selectindex],
      
      
      
      
        bottomNavigationBar:SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,

          snakeShape: SnakeShape.indicator,
          currentIndex: selectindex,
          selectedItemColor: Colors.black,
          snakeViewColor: Colors.black,
          unselectedItemColor:Colors.black38 ,
         // backgroundColor: Colors.blue,


          onTap: (value) {
            setState(() {
              selectindex=value;
            });
          },
          items:iconAndString.entries.map((e) =>  BottomNavigationBarItem(icon: Icon(e.value),label: e.key),).toList() ,
      
        ) ,
      
      ),
    );
  }
}