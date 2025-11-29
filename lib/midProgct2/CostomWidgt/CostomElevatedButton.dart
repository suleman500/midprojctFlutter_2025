import 'package:flutter/material.dart';

class Costomelevatedbutton extends StatelessWidget {

VoidCallback onpress;
String names;
Costomelevatedbutton({required this.onpress,required this.names});
  @override
  Widget build(BuildContext context){

    return ElevatedButton(


        style: ButtonStyle(backgroundColor:WidgetStateProperty.all(Colors.cyan) )
        ,onPressed: onpress, child: Text(names),);

  }

}