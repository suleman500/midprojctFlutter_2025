import 'package:flutter/material.dart';
import 'package:orojct/GoodFood/Widgte/faivertCart.dart';

import '../modle/modelProdactFood.dart';

class Favarit extends StatefulWidget {

  @override
  State<Favarit> createState() => _FavaritState();
}

class _FavaritState extends State<Favarit> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Modelproductfood>favorr= foodList.where((element) =>element.isFav==true ,).toList();
    return   Scaffold(


      body:
      favorr.isEmpty?

          Column(children: [Text("is Empty "),
          Icon(Icons.clear_outlined)],)
       :ListView.builder(itemCount: foodList .length,itemBuilder: (context, index) {
      return Faivertcart(favirt: foodList [index],
        onTap: () {
        int indexMela=foodList.indexOf(favorr[index]);
       setState(() {
         foodList[indexMela]=foodList[indexMela].copyWith(isFav: false);
       });

      },);
    },),


    );
  }
}
