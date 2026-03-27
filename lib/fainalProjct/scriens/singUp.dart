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
import 'package:cloud_firestore/cloud_firestore.dart';


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
  final firebaseAuth  = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool shwopass = false;
  // للمستخدم هاي



  Future<String> singfierbase({required String email, required String pass}) async{
    FirebaseAuth firebaseAuth =FirebaseAuth.instance;//  ojct

    try {
      //  الشغلات من اليوزر الي بدي اتحقق منها
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return "done";
    } on FirebaseAuthException catch (e) {
      // اذا قوي او لا
      if (e.code == 'weak-password') {
        return('The password provided is too weak.');
        // بتحقق من الايمال اذا الادخال صح
      } else if (e.code == 'email-already-in-use') {
        return('The account already exists for that email.');
      }
    } catch (e) {
      return(e.toString());
    }
    return 'eroor';


  }

  // مربوط ببعضه
// هون لازم احطا لازم اعمل ابجكت منه
  FirebaseFirestore firestore = FirebaseFirestore.instance;
// هون فنكشن الاضافه
  Future<void> add(String em,){
    //  هون الكولكشت بتختار مكان وبتعطيه اسم مثل المجل
    CollectionReference user= firestore.collection("userr");
    //  عشان احط البنات اعملت سيت
    // وبتتخزن على شكل ماب
    return user.doc(firebaseAuth.currentUser!.uid).set(
        {
          'email': em,
          'role': "user"
        }


    );
  }





  singup(String email, String pass, String fiersName, String lastName)async {


    if (_formKey.currentState!.validate()) {
      if (email.isNotEmpty &&
          pass.isNotEmpty &&
          fiersName.isNotEmpty &&
          lastName.isNotEmpty) {
        String rusult= await  singfierbase(email:email , pass: pass);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(rusult)));
        if(rusult=='done'){
          add(email);

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
                              control: emaill,
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
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Loginaccont()),
                      );
                    },
                    child: Text(
                      "?login",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),


                  InkWell(
                    onTap: () => singup(
                      emaill.text,
                      password.text,
                      fierstNamee.text,
                      lastNamee.text,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: MediaQuery.of(context).size.width * 0.23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.indigo.withOpacity(0.80),
                      ),
                      child: Center(
                        child: Text(
                          "Sing Up",
                          style: Textstayle.textStyle3.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}