 import 'package:flutter/material.dart';
import 'package:orojct/GoodFood/modle/modelProdactFood.dart';


class Faivertcart extends StatelessWidget {
  Modelproductfood favirt;
  VoidCallback onTap;
  Faivertcart({required this.favirt,required this.onTap});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(

      child: Container(

child:  favirt.isFav? ListTile(
  leading: Image.asset(favirt.namePhoto),
  title: Text(favirt.title),
  subtitle: Text(favirt.subTitle),
  trailing: InkWell(
onTap: onTap,

      child: Icon(Icons.favorite)),


) :Text("")
      ),

    );
  }


}