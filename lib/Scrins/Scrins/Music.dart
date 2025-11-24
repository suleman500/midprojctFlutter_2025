import 'package:flutter/material.dart';
import 'package:orojct/Scrins/modelScrin1Listvie.dart';

import '../../Stayle/spashColer.dart';
import 'MyStoris/storiCr7.dart';
import 'MyStoris/storiJordan.dart';





class Music  extends StatefulWidget{
  
  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List<modelStori> listStori=[

    modelStori(nameStori: "CR7", imeg: "images/CR777.jpg", textStori: "jjjjjjjj",on: cCr7()),
    modelStori(nameStori: "kingjordan ", imeg: "images/jordan3.jpg", textStori: "jjjjjjjj",on:Storijordan()),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(),

      body: Container(
        decoration: Splshcoler.colerSplash3,
        child: ListView.custom(childrenDelegate: SliverChildBuilderDelegate(childCount:listStori.length,(context, index) {
          return stoirr(listStori[index]);

        },)),
      )
    );
  }

Widget stoirr(modelStori sto, ){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: Splshcoler.colerSplash,
        child: ListTile(
          title:Text(sto.nameStori,style: TextStyle(fontSize: 15),),
          trailing: Image.asset(sto.imeg),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => sto.on,));
          },



        ),
      ),
    );

}
}


class modelStori{
  String nameStori;
  String imeg;
  IconData ?imeg2;
  String textStori;
  Widget on;
  modelStori({required this.nameStori,required this.imeg, this.imeg2,required this.textStori,required this.on});
  
  
  
}