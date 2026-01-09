import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/scriens/loginAccont.dart';

class Splashscreen extends StatefulWidget {




    @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginaccont()),
      );
    });
  }



    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [


            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.25,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.13,
              child: Text(
                "Welcoom",
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: "rrt"
                ),
              ),
            ),


            Center(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.50,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.19,
                child: Image.asset(
                  "images/logo.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),


            Positioned(
              bottom: 30,
              left: 30,
              child: Text(
                "ARENAGamesSHOP",
                style: TextStyle(
                    color: Colors.blue.shade300,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "rrt"
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
