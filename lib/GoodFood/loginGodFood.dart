import 'package:flutter/material.dart';
import 'package:orojct/GoodFood/Widgte/CostomWidgtTextFeld.dart';

import 'HomeScreenGoodFood.dart';
import 'Style/DecrionStayle.dart';
import 'Style/textStayl.dart';

class Logingodfood extends StatefulWidget {
  @override
  State<Logingodfood> createState() => _LogingodfoodState();
}

class _LogingodfoodState extends State<Logingodfood> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Decrionstayle.styleDecion,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Long In", style: Textstayl.styletext),
            Container(
              decoration: Decrionstayle.styleDecion,

              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Costomwidgttextfeld(
                            label: Icons.email,
                            hint: "Enter Email",
                            enabled: true,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Costomwidgttextfeld(
                            label: Icons.lock,
                            suffix: Icons.lock_open,
                            hint: "Enter Password",
                            enabled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreengoodfood(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Eroorr")));
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),

                  width: MediaQuery.of(context).size.width * 2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Center(
                    child: Text("Login", style: TextStyle(fontSize: 40)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
