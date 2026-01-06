import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:orojct/midProgct2/Stayle/staylText.dart';
class Loginaccont extends StatefulWidget {

  @override
  State<Loginaccont> createState() => _LoginaccontState();
}

class _LoginaccontState extends State<Loginaccont> {
  bool isLogonOrSingUp=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,


            decoration: BoxDecoration(
                color: Colors.black.withOpacity(1),
              image: DecorationImage(image:AssetImage("images/GAMING.jpeg"),
                fit: BoxFit.cover,

              )



            ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Container(


               decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.white24,),
               child: Column(children: [

                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person,color: Colors.black,size: 40,),
backgroundColor: Colors.white54,
                ),

                 Form(


                   child: Container(
                       width: MediaQuery.of(context).size.width*0.75,
                       height: MediaQuery.of(context).size.width*0.23,

                       child: CustomTextField(label: Icons.nightlight_outlined, hint: "Email@gmail.c...", helper: "")),
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width*0.75,
                     height: MediaQuery.of(context).size.width*0.23,


                     child: CustomTextField(label: Icons.nightlight_outlined, hint: "1354ug", helper: "")),

                 isLogonOrSingUp?        Container(
                     width: MediaQuery.of(context).size.width*0.75,
                     height: MediaQuery.of(context).size.width*0.23,


                     child: CustomTextField(label: Icons.nightlight_outlined, hint: "1354ug", helper: "")):Text("")


               ],


               ),
             ),

                   InkWell(
                       onTap: () {
                         setState(() {
                           isLogonOrSingUp=true;
                         });
                       },
                       child: Text("Create an Account  ?",style: TextStyle(color: Colors.blueAccent,fontSize: 15),))
               , SizedBox(height: 13,)
               , InkWell(onTap: () {
                 setState(() {
                   isLogonOrSingUp=false;
                 });
               },child: Text("Forgot Your Password ?",style: TextStyle(color: Colors.blueAccent))),

SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   InkWell(
                     onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Firstpage() ,)),
                     child: Container(
                       width: MediaQuery.of(context).size.width*0.50,
                       height: MediaQuery.of(context).size.width*0.23,

                       decoration:BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.indigo.withOpacity(0.80),) ,

                       child: Center(child: Text("Login",style: Stayltext.textStyle.copyWith(fontSize: 20),)),
                     ),
                   )

                  ],
                )

            ],)

            ),


          ],
        ),
      ) ,


    );
  }
}