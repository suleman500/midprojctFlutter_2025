import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/CostomWidgt/CostomElevatedButton.dart';
import 'package:orojct/midProgct2/CostomWidgt/textFormCostom.dart';

import 'Stayle/styleDcrion.dart';
import 'homePag.dart';


class LongIn extends StatefulWidget{
  @override
  State<LongIn> createState() => _LongInState();
}

class _LongInState extends State<LongIn> {
  String singin = "Sing In";

  String Singup = "Sing UP";

  String namepag = "Long ";
  bool chikeSingUp = false;
  bool obscuer = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController control = TextEditingController();
  String helpp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        clipBehavior: Clip.none,


        children: [


          Positioned(

              child: Container(
                // width: MediaQuery.of(context).size.width*0.5,
                // height: MediaQuery.of(context).size.height*0.,
                decoration: StyleDcrion.stylDorion,


              )),
          Positioned(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,

              left: 0,
              bottom: 1,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1,
                //height: MediaQuery.of(context).size.height*0.6,
                decoration: StyleDcrion.stylDorion.copyWith(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color(0xFFE3F2FD),
                      Color(0xFFBBDEFB),
                      Color(0xFF90CAF9),
                      Color(0xFF64B5F6),
                      Color(0xFF42A5F5),
                      Color(0xFF2196F3),
                      Color(0xFF1E88E5),


                    ], begin: AlignmentGeometry.topLeft)),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    chikeSingUp ? Text("") : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(onTap: () {

                      },
                          child: Text("Forgot your password?",
                            style: TextStyle(color: Colors.white),)),
                    ),


                    Costomelevatedbutton(onpress: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Homepag(),));
                        }

                        else {
                          namepag = singin;
                          chikeSingUp = false;

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter Form")));
                        }
                      });
                    }, names: singin),

                    Costomelevatedbutton(onpress: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Homepag(),));

                        }

                        namepag = Singup;
                        chikeSingUp = true;
                      });
                    }, names: Singup)


                  ],),

              )),

          Positioned(
            bottom: 245,
            left: 110,
            child: Container(
              width: 150,
              height: 150,
              //color: Colors.red,
              child: Image.asset("images/Look.png"),),
          ),

          Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.13,
              child: Container(
                width: 200,
                height: 200,

                //color: Colors.red,
                child: Text(namepag, style: TextStyle(fontFamily: "rrt1",
                    fontSize: 50,
                    shadows: [
                      Shadow(color: Colors.white,
                          blurRadius: 10,
                          offset: Offset(0, 0))
                    ]),),


              )),


          Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.100,


              child: Container(

                decoration: StyleDcrion.stylDorion.copyWith(
                  borderRadius: BorderRadius.circular(20), border: Border.all(),
                ),

                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.6,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      CircleAvatar(radius: 44,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person, size: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1, color: Colors.white,),),
                      Expanded(


                          child: Form(
                            key: _formKey,

                            child: Column(children: [

                              Expanded(child: TextformCostom(label: Icons.email,
                                  hint: "Email.gmail.com",
                                  helper: helpp


                              )),

                              Expanded(child: TextformCostom(
                                  label: Icons.lock_outline,
                                  hint: "password",
                                  helper: "",
                                  obscuerr: obscuer,
                                  io: InkWell(onTap: () {
                                    setState(() {
                                      chickobcuers();
                                    });
                                  }, child: Icon(Icons.lock_open)))),
                              chikeSingUp ? Expanded(child: TextformCostom(
                                  label: Icons.lock_reset_sharp,
                                  hint: "password Agen",
                                  obscuerr: obscuer,
                                  helper: "")) : Text(""),


                            ],),
                          )
                      )


                    ],),
                ),

              ))


        ],
      ),


    );
  }
// اضهار و اخفاء كلمت السر
  chickobcuers() {
    setState(() {
      obscuer = !obscuer;
    });
  }
}