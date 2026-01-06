import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orojct/fainalProjct/models/modelShopOrder.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomShoing.dart';
import 'package:orojct/fainalProjct/widget/costom_prodact.dart';
class ShoppingCart extends StatefulWidget {
  


  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

body: orderList.isNotEmpty?ListView.builder(itemCount: orderList.length,itemBuilder: (context, index) =>OrderItem(order:orderList[index],onTap:() => delete(index) ,) ):Column
  (
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

  LottieBuilder.network("https://lottie.host/feda6d30-9450-4b78-9f01-3a93948365f7/Y5R9QxEdZa.json"),
    Text("NO Requests",style: Textstayle.textStyle,)
],),



    );


  }

  delete(int index){
    setState(() {
      orderList.removeAt(index);
    });


  }
}