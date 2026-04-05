import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/slider.dart';


class CostomSliderr extends StatelessWidget {
  final ModelSlider phto;
  CostomSliderr({required this.phto});
  @override
  Widget build(BuildContext context) {

    return

      ClipRRect(
        
borderRadius: BorderRadiusGeometry.circular(20),
        child:
         


             Image.network(
              phto.namePhtoos,fit: BoxFit.cover
             
                       ),



    );
  }

}

