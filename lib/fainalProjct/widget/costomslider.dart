import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/slider.dart';
import 'package:orojct/midProgct2/models/modelPhoto.dart';

class CostomSliderr extends StatelessWidget {
  ModelSlider phto;
  CostomSliderr({required this.phto});
  @override
  Widget build(BuildContext context) {

    return

       Container(
        //margin: EdgeInsets.all(8),
        // width: 150,


        child:
          // borderRadius: BorderRadius.circular(15),


             Image.asset(
              phto.namePhtoos,fit: BoxFit.cover
             
                       ),



    );
  }

}

