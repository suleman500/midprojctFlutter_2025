import 'package:flutter/material.dart';
class StyleDcrion {

  static BoxDecoration stylDorion = BoxDecoration(
    gradient: LinearGradient(colors: [

      Color(0xFFE3F2FD),
      Color(0xFFBBDEFB),
      Color(0xFF90CAF9),
      Color(0xFF64B5F6),
      Color(0xFF42A5F5),
      Color(0xFF2196F3),
      Color(0xFF1E88E5),

    ],
        //end: AlignmentGeometry.bottomLeft,
       // begin: AlignmentGeometry.bottomCenter

    ),
    borderRadius: BorderRadius.circular(25

    ),
    boxShadow: [BoxShadow(blurRadius: 50)],


  );


}