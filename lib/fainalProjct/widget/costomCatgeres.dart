import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/models/modelTopCategories.dart';

import '../models/Categories.dart';
import 'package:lottie/lottie.dart';

class costomCatger extends  StatelessWidget{

  ModelCgories gatoger;

  VoidCallback voidCallback;

  costomCatger({required this.gatoger,required this.voidCallback});
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: InkWell(
          onTap:voidCallback,

          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(


                  child: Lottie.network(gatoger.lotiNames,backgroundLoading: true),
                ),
                //SizedBox(height: 5),
                Text(
                  gatoger.namesTopCate,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.027,fontFamily: "rrt1"),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


