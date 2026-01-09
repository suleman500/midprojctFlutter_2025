import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/slider.dart';


class CostomSliderr extends StatelessWidget {
  ModelSlider phto;
  CostomSliderr({required this.phto});
  @override
  Widget build(BuildContext context) {

    return

      ClipRRect(
        
borderRadius: BorderRadiusGeometry.circular(20),
        child:
         


             Image.asset(
              phto.namePhtoos,fit: BoxFit.cover
             
                       ),



    );
  }

}

