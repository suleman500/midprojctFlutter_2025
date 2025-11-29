import 'package:flutter/material.dart';
import 'long_in.dart';
class HomeScrin  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(



      body: Stack(


        children: [


Positioned(

    child: Container(
     // width: MediaQuery.of(context).size.width*0.5,
     // height: MediaQuery.of(context).size.height*0.,
decoration: BoxDecoration(color: Colors.cyan, ),
  

)),
          Positioned(
            height: MediaQuery.of(context).size.height*0.4 ,

              left: 0,
bottom: 1,
              child: Container(
                 width: MediaQuery.of(context).size.width*1,
                //height: MediaQuery.of(context).size.height*0.6,
decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(""""[Shop Games] is your perfect gateway to a limitless world of apps and games! A store specially designed to meet all your digital needs, combining simplicity, security, and a vast diversity that places the best global and Arabic applications at your fingertips."   """,style: TextStyle(fontSize: 15,fontFamily: "rrt1",shadows: [Shadow(blurRadius: 2.5)]),),
                  )
                  ,ElevatedButton(style: ButtonStyle(backgroundColor:WidgetStateProperty.all(Colors.cyan) ),onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => LongIn(),));
                  }, child: Icon(Icons.navigate_next))
                ],),

              )),

Positioned(
    top:MediaQuery.of(context).size.height*0.1 ,
    left:MediaQuery.of(context).size.height*0.15 ,
    child: Container(
      width: 200,
      height: 200,

      //color: Colors.red,
child: Text("Shop Games",style: TextStyle(fontFamily:"rrt",fontSize: 50,shadows: [Shadow(color:Colors.black,blurRadius: 8,offset: Offset(0,5.3 ) )]),),


)),



Positioned(
    top: MediaQuery.of(context).size.height*0.4,
    left: MediaQuery.of(context).size.height*0.100,




    child: Container(
  //color: Colors.deepPurpleAccent,

  width: MediaQuery.of(context).size.width*0.6,
  height: MediaQuery.of(context).size.height*0.3,
      child: Image.asset("images/iscein.png"),

))




        ],
      ),


    );
  }

}