import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginaccont extends StatefulWidget {
  @override
  State<Loginaccont> createState() => _LoginaccontState();
}

class _LoginaccontState extends State<Loginaccont> {
  bool isLogonOrSingUp = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController agenPass = TextEditingController();
  TextEditingController fierstName = TextEditingController();
  TextEditingController lastName = TextEditingController();









  final _formKey = GlobalKey<FormState>();
  bool shwopass = false;

  singup(String email, String pass, String fiersName, String lastName) {
    listLogin.add(
      Dataloginandsingup(
        ferstName: fiersName,
        lastName: lastName,
        emmail: email,
        password: pass,
        balance: 100.00,
      ),

    );


    if (_formKey.currentState!.validate()) {
      if (email.isNotEmpty &&
          pass.isNotEmpty &&
          fiersName.isNotEmpty &&
          lastName.isNotEmpty) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Firstpage(
              emails: email,
              pass: pass,
              firstName: fiersName,
              lastName: lastName,
              balance: 100.00,
            ),
          ),
        );
      } else {
        setState(() {});
      }
    }
  }

  chickAacont()  {
    if (_formKey.currentState!.validate()) {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        var users = listLogin.firstWhere(
              (e) => e.emmail == email.text && e.password == password.text,
        );



  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => Firstpage(
        emails: users.emmail,
        pass: users.password,
        firstName: users.ferstName,
        lastName: users.lastName,
        balance: users.balance,
      ),
    ),
  );




      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

                        isLogonOrSingUp
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height:
                                    MediaQuery.of(context).size.width * 0.23,

                                child: CustomTextField(
                                  label: Icons.lock_reset,
                                  hint: "             Agen Password",
                                  obscureText: shwopass,
                                  helper: "",
                                  control: agenPass,
                                ),
                              )
                            : Text(""),
                        isLogonOrSingUp
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height:
                                    MediaQuery.of(context).size.width * 0.23,

                                child: CustomTextField(
                                  label: Icons.panorama_fish_eye_rounded,
                                  hint: "          First Name",
                                  obscureText: false,
                                  helper: "",
                                  control: fierstName,
                                ),
                              )
                            : Text(""),

                        isLogonOrSingUp
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height:
                                    MediaQuery.of(context).size.width * 0.23,

                                child: CustomTextField(
                                  label: Icons.panorama_fish_eye_rounded,
                                  hint: "          Last Name",
                                  obscureText: false,
                                  helper: "",
                                  control: lastName,
                                ),
                              )
                            : Text(""),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        isLogonOrSingUp = !isLogonOrSingUp;
                      });
                    },
                    child: isLogonOrSingUp
                        ? Text(
                            "Login  ?",
                            style: TextStyle(color: Colors.blueAccent),
                          )
                        : Text(
                            "Create an Account  ?",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ),
                          ),
                  ),
                  SizedBox(height: 13),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLogonOrSingUp = false;
                      });
                    },
                    child: Text(
                      "Forgot Your Password ?",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      isLogonOrSingUp
                          ? InkWell(
                              onTap: () => singup(
                                email.text,
                                password.text,
                                fierstName.text,
                                lastName.text,

                              ),

                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.50,
                                height:
                                    MediaQuery.of(context).size.width * 0.23,

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
                            )
                          : Align(
                        alignment: AlignmentGeometry.bottomRight,
                            child: InkWell(
                                onTap: ()  {
                                  chickAacont();


                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.50,
                                  height:
                                      MediaQuery.of(context).size.width * 0.23,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.indigo.withOpacity(0.80),
                                  ),

                                  child: Center(
                                    child: Text(
                                      "Laog in",
                                      style: Textstayle.textStyle3.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                    ],
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
