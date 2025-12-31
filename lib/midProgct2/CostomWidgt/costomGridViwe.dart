import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/models/modelGridView.dart';
import 'package:orojct/orderDetalisPag.dart';

class CostomGridViwer extends StatefulWidget {
   ModelGridview moGrd;

   CostomGridViwer({ required this.moGrd});

  @override
  State<CostomGridViwer> createState() => _CostomGridViwerState();
}

class _CostomGridViwerState extends State<CostomGridViwer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {


          Navigator.push(context, MaterialPageRoute(builder: (context) {
return Orderdetalispag(nameProdact:widget.moGrd.namePrdact ,photoProdact: widget.moGrd.PhotoProdact,price:  widget.moGrd.price);
          },));






      },child: Container(


      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          
          Container(
            width: double.infinity,
            height: 100,
            child: Image.asset(
              widget.moGrd.PhotoProdact,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              widget.moGrd.namePrdact,

              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "rrt1"
              ),
            ),
            
          ),

          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Expanded(
              child: Row(
                children: [

              Icon(Icons.star_border),
                  Icon(Icons.star_border),
                  Icon(Icons.star_border),
                  Icon(Icons.star_border),
                  Icon(Icons.star_border),


                ],

              ),
            ),
            ),

          

        // Expanded(child: Text(widget.moGrd.price)),



          Expanded(


              child: Text(widget.moGrd.price.toString()+"\$",style: TextStyle(fontSize: 10),)),


        ],


      ),



    ),);



  }
}