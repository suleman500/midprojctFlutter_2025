import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/midProgct2/models/modelGridView.dart';
import 'package:orojct/orderDetalisPag.dart';

class CostomProdact extends StatefulWidget {
  ModelProduct moGrd;

  CostomProdact({ required this.moGrd});

  @override
  State<CostomProdact> createState() => _CostomGridViwerState();
}

class _CostomGridViwerState extends State<CostomProdact> {
  @override
  Widget build(BuildContext context) {
    return InkWell(


      onTap: () {


        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Orderdetalispag(nameProdact:widget.moGrd.namePrdact ,photoProdact: widget.moGrd.photoProdact,price:  widget.moGrd.price);
        },));
//  لا تنسى تغبر مكان صفحت تغير المنتجات





      },child: Container(
      //width: MediaQuery.of(context).size.width * 0.05,
      //height: MediaQuery.of(context).size.height * 0.25,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [

          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Image.asset(
              widget.moGrd.photoProdact,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width:MediaQuery.of(context).size.width * 0.44,
                  height: MediaQuery.of(context).size.height * 0.20,

                  child: Row(

                    children: [

                       Icon(Icons.star_border),
                 Text("5")




                    ],

                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                widget.moGrd.namePrdact,

                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: "rrt1"
                ),
              ),

            ),
          ),


          // Expanded(child: Text(widget.moGrd.price)),



          Expanded(


              child: Align(
                  alignment: Alignment.topRight,
                  child: Text(widget.moGrd.price.toString()+"\$",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),))),


          
          Expanded(child: Stack(children: [
            Icon(Icons.eighteen_mp_outlined)
          ],))
          
        ],


      ),



    ),);



  }
}