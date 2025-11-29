import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/models/modelPhoto.dart';

class Costomwidgtphtolistads extends StatelessWidget {
  Modelphoto phto;
  Costomwidgtphtolistads({required this.phto});
  @override
  Widget build(BuildContext context) {

    return Container(
      //margin: EdgeInsets.all(8),
      // width: 150,


      child: Container(
        // borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          phto.namePhtoos, height: 100,

        ),
      ),
    );
  }

}

