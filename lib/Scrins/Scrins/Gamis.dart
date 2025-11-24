import 'package:flutter/material.dart';

import '../../Stayle/spashColer.dart';
import 'MyGamess/ XandO.dart';


class Gamis  extends StatelessWidget{
List<modelGames> listGames=[

  modelGames(imegGames: "images/XandO.jpeg", nameGames: "X and O", pageGames: xando()),
  modelGames(imegGames: "images/XandO.jpeg", nameGames: "X and O", pageGames: xando()),



];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
appBar: AppBar(),
      body: Container(
        decoration: Splshcoler.colerSplash2,
        child: ListView.builder(physics: AlwaysScrollableScrollPhysics(),itemCount: listGames.length,itemBuilder: (context, index) {
          return myGames(listGames[index], context);
        },),
      ),

    );
  }
Widget myGames(modelGames g,BuildContext context){

    return Container(
      color: Colors.deepPurpleAccent,
      margin: EdgeInsets.all(16),
      child: Padding(

        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          title: Text(g.nameGames,style: TextStyle(color: Colors.white),),
          trailing: Image.asset(g.imegGames),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => g.pageGames,));
          },


        ),
      ),
    );

}

}

class modelGames{

  String imegGames;
  String nameGames;
  Widget pageGames;
  modelGames({required this.imegGames,required this.nameGames,required this.pageGames});


}