import 'package:flutter/material.dart';

class Costomfoodcatger  extends StatelessWidget {
  String text;

  Costomfoodcatger({required this.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(

      child: Center(child: Text(text)),

    );
  }


}