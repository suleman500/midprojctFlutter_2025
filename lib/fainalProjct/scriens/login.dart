import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/scriens/home_shop_game.dart';
import 'package:orojct/fainalProjct/scriens/singUp.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'adminScreen.dart';

class Loginaccont extends StatefulWidget {
  @override
  State<Loginaccont> createState() => _LoginaccontState();
}

class _LoginaccontState extends State<Loginaccont> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool shwopass = false;


  Future<String> login(String email, String pass) async {
    try {
      //  هون بشيك اذا البنات موجود  الايمال و كلمت السر
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return 'done';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('invalidemail.');
      } else if (e.code == 'invalid-credential') {
        print('invalid credential.');
      }
    }
    return 'error';
  }


  chickAacont() async {
    if (_formKey.currentState!.validate()) {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        String ruselt = await login(email.text, password.text);
        if (ruselt == 'done') {

          final doc = await FirebaseFirestore.instance.collection('userr').doc(firebaseAuth.currentUser!.uid).get();



            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(ruselt)));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Firstpage()),
            );

        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [




            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(1),
                image: DecorationImage(
                  image: AssetImage("images/opo.jpeg"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white24,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 40,
                          ),
                          backgroundColor: Colors.white54,
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.width * 0.23,
                            child: CustomTextField(
                              label: Icons.email,
                              hint: "           Email@gmail.c...",
                              helper: "",
                              control: email,
                              obscureText: false,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.width * 0.23,
                          child: CustomTextField(
                            label: Icons.lock,
                            hint: "     123",
                            obscureText: shwopass,
                            helper: "",
                            control: password,
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  shwopass = !shwopass;
                                });
                              },
                              child: shwopass
                                  ? Icon(Icons.key)
                                  : Icon(Icons.key_off_sharp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13),
                  InkWell(
                    onTap: () {

                    },
                    child: Text(
                      "Forgot Your Password ?",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),

                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SingUpAccount()),
                      );
                    },
                    child: Text(
                      "SaingUp  ?",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          chickAacont();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          height: MediaQuery.of(context).size.width * 0.23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.indigo.withOpacity(0.80),
                          ),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: Textstayle.textStyle3.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Colors.purple, Colors.deepPurple],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.6),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.admin_panel_settings, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddProductPage()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}