import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/scriens/login.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:orojct/firebase_options.dart';

class SingUpAccount extends StatefulWidget {
  @override
  State<SingUpAccount> createState() => _SingUpAccountState();
}

class _SingUpAccountState extends State<SingUpAccount> {
  TextEditingController emaill = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController agenPass = TextEditingController();
  TextEditingController fierstNamee = TextEditingController();
  TextEditingController lastNamee = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool shwopass = false;

  Future<String> singfierbase({required String email, required String pass,required String firstName,required lastName }) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,

      );


      return "done";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e.toString();
    }
    return 'error';
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> add(String em,String firstName,String lastName ) {
    CollectionReference user = firestore.collection("userr");
    return user.doc(firebaseAuth.currentUser!.uid).set({
      'email': em,
      'role': "user",
      'firstName': firstName,
      'lastName': lastName,

    });
  }

  singup(String email, String pass, String fiersName, String lastName) async {
    if (_formKey.currentState!.validate()) {
      if (email.isNotEmpty &&
          pass.isNotEmpty &&
          fiersName.isNotEmpty &&
          lastName.isNotEmpty) {
        String result = await singfierbase(email: email, pass: pass,firstName: fiersName,lastName: lastName);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
        if (result == 'done') {
          await  add(email,fiersName,lastName);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Loginaccont()),
          );
          password.clear();
          agenPass.clear();
          fierstNamee.clear();
          lastNamee.clear();
          emaill.clear();
        }
      } else {
        setState(() {});
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
              //SizedBox(height: 80),

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
                              colors: [Colors.indigo.shade600, Colors.indigo.shade800],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Form Sign Up",
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
                                control: emaill,
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.width * 0.23,
                          child: CustomTextField(
                            label: Icons.lock_reset,
                            hint: "             Agen Password",
                            obscureText: shwopass,
                            helper: "",
                            control: agenPass,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.width * 0.23,
                          child: CustomTextField(
                            label: Icons.panorama_fish_eye_rounded,
                            hint: "          First Name",
                            obscureText: false,
                            helper: "",
                            control: fierstNamee,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.width * 0.23,
                          child: CustomTextField(
                            label: Icons.panorama_fish_eye_rounded,
                            hint: "          Last Name",
                            obscureText: false,
                            helper: "",
                            control: lastNamee,
                          ),
                        ),

                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginaccont(),
                              ),
                            );
                          },
                          child: Text(
                            "Login ?",
                            style: TextStyle(color: Colors.indigo, fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => singup(
                          emaill.text,
                          password.text,
                          fierstNamee.text,
                          lastNamee.text,

                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.indigo.shade600, Colors.indigo.shade800],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}