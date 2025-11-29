import 'package:flutter/material.dart';

import '../midProgct2/models/modelnAavioinBar.dart';

 class Homtask extends StatefulWidget {

  @override
  State<Homtask> createState() => _HomtaskState();
}

class _HomtaskState extends State<Homtask> {
   int index=0;
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
drawer: Drawer(),
      body: Container(


      ),

  bottomNavigationBar: BottomNavigationBar(
  currentIndex: index,
  onTap: (value) {
    setState(() {
      index=value;
    });
  }
  ,items:botinNavionBar.map((e) => BottomNavigationBarItem(icon: Icon(e.icons),label:e.label,),).toList() ),

    );
  }
}