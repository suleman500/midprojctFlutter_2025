import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/CostomWidgt/costomWidgtDrawe.dart';

class Stayldrower {


  static Drawer staylDrower=Drawer(

    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
SizedBox(width: 20,),
      CircleAvatar(radius: 60,),
        SizedBox(width: 20,),

Divider(),
//بدي اعمل  costom****************
Container(
  child: Column(
    children: [
      ListTile(
        title:Text("Setting") ,
        leading: Icon(Icons.settings),


      ),


      ListTile(
        title:Text("Support") ,
        leading: Icon(Icons.support_agent),
      ),

      ListTile(
        title:Text("Account") ,
        leading: Icon(Icons.account_circle_outlined),
      ),


    ],
  ),
),



    ],),

  );

}