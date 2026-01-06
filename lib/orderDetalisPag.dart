import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/Categories.dart';
import 'package:orojct/fainalProjct/scriens/payProdact.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomComentParson.dart';

import 'fainalProjct/models/modelParson.dart';
import 'midProgct2/Stayle/staylText.dart';
import 'midProgct2/Stayle/styleDcrion.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'dart:math';


class Orderdetalispag extends StatelessWidget {
  String nameProdact;
  double price;
  String photoProdact;
  String? discrbion;

  Orderdetalispag(
      {required this.nameProdact, required this.price, required this.photoProdact, this.discrbion});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(11);
    
    return Scaffold(
    appBar: AppBar(),

    backgroundColor:Colors.white ,
    body: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(photoProdact),

    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Card(child: Text(""),), Card(child: Text("0"),), Card(child: Text("0"),),

    ],),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("5/6",style: Stayltext.textStyle.copyWith(fontSize: 13)),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("JOR${price.toString()}",style:Stayltext.textStyle.copyWith(fontSize: 15) ,),
    ),

    ],),

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Text("4.88",style:Stayltext.textStyle.copyWith(fontSize: 14),),
    SizedBox(width: 2,),
    Icon(Icons.star,color: Colors.amber,size: 15,)
    ],),
    ),

    ListTile(


    title: ReadMoreText(
    "${discrbion!}",
    trimLines: 2,
    colorClickableText: Colors.black,
    trimMode: TrimMode.Line,
    trimCollapsedText:"More" ,

    trimExpandedText:"...Less",
    lessStyle:Stayltext.textStyle.copyWith(fontSize: 15) ,
    moreStyle:Stayltext.textStyle.copyWith(fontSize: 15) ,

    ),
    //subtitle: Text(discrbion!),


    ),
    SizedBox(height: 40,),
    Container(
    width: MediaQuery.of(context).size.width,


    height: MediaQuery.of(context).size.height*0.50,
    child: ListView.builder(itemCount:6 ,itemBuilder: (context, index) {
    return Costomcomentparson(paerson: commentList[randomNumber]);
    },),

    ),
    SizedBox(height: 50,),
    ],

    ),
    ),

    bottomSheet:InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Payprodact(photoProdact: photoProdact, namePrdact:nameProdact),));
      },

      child: Card(
      color: Colors.blue,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
        height:MediaQuery.of(context).size.height*0.07 ,
        child: Column(children: [
        Icon(Icons.shopping_cart,size: 33,color: Colors.black38,),
        Text("شراء الان",)

        ],),),



      ],),
      ),
    ),


    );
  }


}