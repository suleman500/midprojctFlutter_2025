import 'dart:ffi';

import 'package:flutter/material.dart';

import 'midProgct2/Stayle/staylText.dart';
import 'midProgct2/Stayle/styleDcrion.dart';


class Orderdetalispag extends StatelessWidget{
  String nameProdact;
  double price;
  String photoProdact;
  Orderdetalispag({required this.nameProdact,required this.price,required this.photoProdact});

@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),

      backgroundColor:Colors.white ,
      body: SingleChildScrollView(
        child: Column(

          children: [
        
        
           Container(
            decoration: StyleDcrion.stylDorion,
        
          width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
        
        
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(photoProdact),
                ListTile(title: Text(nameProdact, style: Stayltext.textStyle,),
                  subtitle: Text(nameProdact),
                  leading: InkWell(onTap: () {
        
                  },child: Container(
                    width: 40,
                    decoration: StyleDcrion.stylDorion.copyWith(border: Border.all(width: 1)),
                      child: Icon(Icons.add_shopping_cart))),
        
        
                ),
                Container(
                  child: Text(price.toString()),
                  
                )
              ],
            ),
          ),
        
        
        ],),
      ),

    );
  }


}