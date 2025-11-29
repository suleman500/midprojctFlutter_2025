import 'package:flutter/material.dart';


class Costomwidgtdrawe extends StatelessWidget {
  IconData icons;
  String name;
  Costomwidgtdrawe({required this .icons,required this.name });
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Drawer(
        child: Column(children: [

         Divider(),

          Column(
            children: [
              Icon(icons),
              Text(name),
            ],
          ),
          Divider(),


        ],),

      ),

    );
  }


}