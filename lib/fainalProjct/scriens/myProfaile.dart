import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';

class Myprofaile extends StatelessWidget {
  String email;
  String password;
  String ferstName;
  String lastName;
  double balance;


  Myprofaile({
    required this.email,
    required this.password,
    required this.ferstName,
    required this.lastName,
    required this.balance,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),

            Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(
                          "First Name:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(ferstName!),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.person_outline, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(
                          "Last Name:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(lastName!),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(
                          "Email:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(email!),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.lock, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(
                          "Password:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text("********"),
                        Text("balance : ${balance!}")
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),


            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(child: Icon(Icons.support_agent, color: Colors.blue)),

                    Text(
                      "Support",
                      style: Textstayle.textStyle3.copyWith(color: Colors.blueAccent),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Contact: Gamies@example.com",
                    style: Textstayle.textStyle3
                ),
                SizedBox(height: 20),
                Text(
                  "© 2026 MyApp. All rights reserved.",
                  style: Textstayle.textStyle3
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}