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

import 'package:google_sign_in/google_sign_in.dart';

import 'adminScreen.dart';

class Loginaccont extends StatefulWidget {
  @override
  State<Loginaccont> createState() => _LoginaccontState();
}

class _LoginaccontState extends State<Loginaccont> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //final firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool shwopass = false;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
          final doc = await FirebaseFirestore.instance
              .collection('userr')
              .doc(firebaseAuth.currentUser!.uid)
              .get();
          String role = doc['role'] ?? 'user';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(ruselt)));

          if (role == 'admin') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddProductPage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Firstpage()),
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(
                "ARENAGamesSHOP",
                style: TextStyle(
                  color: Colors.blue.shade300,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "rrt",
                ),
              ),

              SizedBox(height: 80),

              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black38,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.width * 0.23,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.indigo.shade600,
                                Colors.indigo.shade800,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Form Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,

                                fontWeight: FontWeight.w600,
                                fontFamily: "cor",
                              ),
                            ),
                          ),
                        ),

                        CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 40,
                          ),
                          backgroundColor: Colors.white54,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
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

                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot Your Password ?",
                            style: TextStyle(color: Colors.indigo),
                          ),
                        ),
                        SizedBox(height: 13),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingUpAccount(),
                        ),
                      );
                    },
                    child: Text(
                      "SaingUp  ?",
                      style: TextStyle(color: Colors.indigo, fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          chickAacont();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.indigo.shade600,
                                Colors.indigo.shade800,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.indigo.shade600,
                          Colors.indigo.shade800,
                        ],
                      ),
                    ),

                    child: ElevatedButton.icon(
                      onPressed: () async {
                        UserCredential? user = await signInWithGoogle();
                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Firstpage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Google Sign-In Failed")),
                          );
                        }
                      },
                      icon: Icon(Icons.g_mobiledata, color: Colors.red),
                      label: Text("Google"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade100,
                        foregroundColor: Colors.black,
                        minimumSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Container(
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
                          icon: Icon(
                            Icons.admin_panel_settings,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProductPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
