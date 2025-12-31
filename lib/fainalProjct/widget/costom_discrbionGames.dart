

import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/stayle/colorStayle.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:page_transition/page_transition.dart';



class CostomDiscrbiongames extends StatelessWidget{
  String nameProdact;
  double price;
  String photoProdact;
  String discrion;
  CostomDiscrbiongames({required this.nameProdact,required this.price,required this.photoProdact,required this.discrion});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //appBar: AppBar(),

      backgroundColor:Colors.white ,
      body: SingleChildScrollView(
        child: Column(

          children: [


            Container(
decoration:BoxDecoration(color: Colors.black12),

              //width: MediaQuery.of(context).size.width,
              //height:MediaQuery.of(context).size.height,


              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height:MediaQuery.of(context).size.height*0.2,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: StyleColor.style1,
                  child: Container(
decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
                    //flex: 3,

                    child: Image.asset(photoProdact, fit: BoxFit.cover),
                  )),
            )),
                  ListTile(title: Text(nameProdact),
                    //subtitle: Text(nameProdact),
                    leading: InkWell(onTap: () {

                    },child: Container(
                        width: 40,

                        child: Icon(Icons.add_shopping_cart))),


                  ),

                  Container(
                    child: Text(discrion,style: Textstayle.textStyle,),

                  )

                ],
              ),
            ),


          ],),
      ),

    );
  }


}