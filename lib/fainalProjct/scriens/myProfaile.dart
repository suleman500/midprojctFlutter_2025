import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/scriens/login.dart';

class Myprofaile extends StatefulWidget {
  @override
  State<Myprofaile> createState() => _MyprofaileState();
}

class _MyprofaileState extends State<Myprofaile> {


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('userr')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_off, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "No user data found",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          String firstName = data['firstName'] ?? '';
          String lastName = data['lastName'] ?? '';
          String email = data['email'] ?? '';
          String role = data['role'] ?? 'user';


          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.grey)],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      firstName[0],
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text(
                    "$firstName $lastName",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Full Name"),
                ),
              ),

              SizedBox(height: 12),

              Card(
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.blue),
                  title: Text(email, style: TextStyle(fontSize: 16)),
                  subtitle: Text("Email"),
                ),
              ),

              SizedBox(height: 12),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.admin_panel_settings, color: Colors.blue),
                  title: Text(role, style: TextStyle(fontSize: 16)),
                  subtitle: Text("Role"),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),

                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.person, color: Colors.blue),
                              title: Text("Edit Name"),
                              trailing: Icon(Icons.arrow_forward_ios, size: 16),
                              subtitle: Column(
                                children: [
                                  TextFormField(
                        forceErrorText: "New first Name",
                                    controller:firstNameController ,
                        
                                  ),
                                  TextFormField(
                                    forceErrorText: "New last Name",
                                   controller:lastNameController ,
                        
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 0),
                            ListTile(
                              leading: Icon(Icons.email, color: Colors.blue),
                              title: Text("Edit Email"),
                              trailing: Icon(Icons.arrow_forward_ios, size: 16),
                              subtitle: TextFormField(
                                forceErrorText: "New Email",
                                  controller:emailController ,
                        
                                
                                
                              ),
                            ),
                            Divider(height: 0),
                            ListTile(
                              leading: Icon(Icons.lock, color: Colors.blue),
                              title: Text("Change Password"),
                              trailing: Icon(Icons.arrow_forward_ios, size: 16),
                              subtitle: TextFormField(
                                forceErrorText: "New password",
                                controller:passwordController ,
                        
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(onPressed: () {



                        }, child: Text("Cancel")),

                        TextButton(onPressed: () async{

                    await      FirebaseFirestore.instance
                              .collection('userr')
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .update({
                            'email': emailController.text,
                            "firstName":firstNameController.text,
                            'lastName': lastNameController.text,

                          });

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Profile updated successfully")),
                    );

                        }, child: Text("OK")),
                        
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Edit Profile"),
              ),

              SizedBox(height: 30,),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await firebaseAuth.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Loginaccont()),
                          (route) => false,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Logged out successfully")),
                    );
                  },
                  icon: Icon(Icons.logout, color: Colors.red),
                  label: Text(
                    "Log out",
                    style: TextStyle(fontSize: 18, color: Colors.red.shade900),
                  ),

                ),
              ),


            ],
          );
        },
      ),
    );
  }
}
