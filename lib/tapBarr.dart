import 'package:flutter/material.dart';
class Tapbarr extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return DefaultTabController(
     length: 3,
     child: Scaffold(
     
       appBar: AppBar(
         bottom: TabBar(tabs: [
     
           Tab(
             icon: Icon(Icons.home),
     
           ),
     
           Tab(
             icon: Icon(Icons.account_box_outlined),
     
           ),
     
     
           Tab(
             icon: Icon(Icons.home),
     
           ),
     
     
         ]),
         backgroundColor: Colors.amber,

       ),
   //  body: showBottomSheet(context: context, builder: (context) => ,),

     ),
   );
  }

}