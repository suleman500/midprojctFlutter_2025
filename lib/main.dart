import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/scriens/loginAccont.dart';
import 'package:orojct/fainalProjct/scriens/splashScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'fainalProjct/scriens/home_shop_game.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

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


  @override
  Widget build(BuildContext context) {

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),
    builder: EasyLoading.init(),

  );
  }
}

