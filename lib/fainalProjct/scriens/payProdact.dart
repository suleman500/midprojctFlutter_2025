import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orojct/fainalProjct/models/modelShopOrder.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/scriens/home_shop_game.dart';
import 'package:orojct/fainalProjct/scriens/shopping_cart.dart';
import 'package:orojct/fainalProjct/stayle/colorStayle.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Payprodact extends StatefulWidget {
  String namePrdact;
  String photoProdact;

  Payprodact({required this.photoProdact, required this.namePrdact});

  @override
  State<Payprodact> createState() => _PayprodactState();
}

class _PayprodactState extends State<Payprodact> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController lcaion = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  bool fullForme = false;
  IconData? icon;
  String help = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [BoxShadow(blurRadius: 3)]

                ),
                child: Column(
                  children: [
                    Container(
                      
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        widget.photoProdact,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.namePrdact,
                      style: TextStyle(
                        fontSize: 18,

                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),


              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),

                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Container(

                              child: Text(
                                "Location :",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey[700],
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomTextField(
                                obscureText: false,
                                label: Icons.maps_home_work,
                                hint: "Jarash-Sakep",
                                control: lcaion,
                                helper: help,
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Container(

                              child: Text(
                                "Number :",
                                style: TextStyle(
                                  fontSize: 16,

                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomTextField(
                                obscureText: false,
                                label: Icons.phone,
                                hint: "+962779...",
                                keyboardType: TextInputType.numberWithOptions(),
                                control: number,
                                helper: help,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Email
                      Container(
                        child: Row(
                          children: [
                            Container(

                              child: Text(
                                "Email :",
                                style: TextStyle(
                                  fontSize: 16,


                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomTextField(
                                obscureText: false,
                                label: Icons.email_sharp,
                                hint: "Ajhggh@hotmail.com",
                                control: email,
                                suffix: Icon(icon),
                                helper: help,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),


              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.credit_card, color: Colors.blue, size: 30),
                        Text("Credit", style: TextStyle(fontSize: 14)),
                        Radio( value: "",),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.phone_android, color: Colors.blue, size: 30),
                        Text("E-Wallet", style: TextStyle(fontSize: 14)),
                        Radio(value: "", ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.local_shipping, color: Colors.blue, size: 30),
                        Text("Cash", style: TextStyle(fontSize: 14)),
                        Radio(value: "b",),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),


              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),


                ),
                child: InkWell(
                  onTap: () {
                    checkInputForm();
                    fullForme ? EasyLoading.showSuccess('Great Success!') : null;
                    fullForme
                        ? Future.delayed(Duration(seconds: 2)).then((_) {
                      EasyLoading.dismiss();
                      orderList.add(Modelshoporder(
                        namePrdact: widget.namePrdact,
                        photoProdact: widget.photoProdact,
                        locion: lcaion.text,
                        email: email.text,
                        name: number.text,
                      ));
                      Navigator.pop(context);
                    })
                        : null;
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        child: LottieBuilder.network(
                          "https://lottie.host/a8b2d38f-a7c3-49dc-8529-cba360150976/OXf9ivgVQS.json",
                          repeat: true,
                        ),
                      ),
                      Text(
                        "Buying",
                        style: TextStyle(
                          fontSize: 18,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkInputForm() {
    if (_formKey.currentState!.validate()) {
      if (email.text.isNotEmpty && lcaion.text.isNotEmpty && number.text.isNotEmpty) {
        setState(() {
          fullForme = true;
          help = "Good";
        });
      } else {
        setState(() {
          icon = Icons.close;
          print("Plese Enter The Forme");
        });
      }
    }
  }
}