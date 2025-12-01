import 'package:flutter/material.dart';

import 'GoodFood/loginGodFood.dart';
import 'GoodFood/splashScreen.dart';
import 'Task/homTask.dart';
import 'midProgct2/home_Scrin.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen (),

  );
  }
}

