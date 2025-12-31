import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/stayle/colorStayle.dart';

class Costomacionsicons extends StatelessWidget {
  IconData icon;
  Widget  page;
  Costomacionsicons({required this.icon,required this.page});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: StyleColor.style1.copyWith(gradient:LinearGradient(colors: [

        Color(0xFFE3F2FD),
        Color(0xFFBBDEFB),
        Color(0xFFBEC9D1),
        Color(0xABF5F8F8),


      ],)),
      child: CircleAvatar(
        backgroundColor: Colors.white70,

        radius: MediaQuery.of(context).size.width*0.06,
        child: GestureDetector(
          child: Icon(icon,color: Colors.black87,size: MediaQuery.of(context).size.width*0.06,),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
            return page;
          },))



        ),
      ),
    );
  }


}