


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Scrins/Scrine1.dart';
import 'Stayle/costomStaylText.dart';

import 'Stayle/spashColer.dart';

class Splashcreen extends StatefulWidget {
  const Splashcreen({super.key});

  @override
  State<Splashcreen> createState() => _SplashcreenState();
}

class _SplashcreenState extends State<Splashcreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Screen1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: Splshcoler.colerSplash),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                CircleAvatar(
                 // backgroundColor: Colors.black,
                  radius: 80,
child: Image.asset("images/logeoo.png",color: Colors.black,),

                ),
                Text("", style: TextStyle(fontFamily: 'ArefRuqaa',fontWeight:FontWeight.bold ,fontSize: 60),),
              ],
            ),
          ),

          Positioned(bottom: 15, child: CircleAvatar(radius: 50,backgroundColor: Colors.black,child: Image.asset("images/logeoo.png",width: 100,height: 100,color: Colors.white,)), ),
        ],
      ),
    );
  }
}
