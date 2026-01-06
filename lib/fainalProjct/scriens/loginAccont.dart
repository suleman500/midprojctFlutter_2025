import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:orojct/midProgct2/Stayle/staylText.dart';
class Loginaccont extends StatefulWidget {

  @override
  State<Loginaccont> createState() => _LoginaccontState();
}

class _LoginaccontState extends State<Loginaccont> {
  bool isLogonOrSingUp=false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController agenPass = TextEditingController();
  TextEditingController fierstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

singup(String email,String pass,String fiersName,String,lastName){

 listLogin.add(Dataloginandsingup(ferstName: fiersName, lastName: lastName, emmail: email, password: pass));
 print(fiersName);
return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Firstpage(emails: email,pass: pass,firstName: fiersName,lastName: lastName,)));

}
  chickAacont(){
    if(_formKey.currentState!.validate()){
      if(email.text.isNotEmpty&&password.text.isNotEmpty){

       var user= listLogin.any((e) =>e.emmail==email.text&&e.password==password.text ,);
if(user==true){
  print("yass");
   return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Firstpage()));
      }
else{

  print("noo");


}

      }

    }


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,


            decoration: BoxDecoration(
                color: Colors.black.withOpacity(1),
              image: DecorationImage(image:AssetImage("images/GAMING.jpeg"),
                fit: BoxFit.cover,

              )



            ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Container(


               decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.white24,),
               child: Column(children: [

                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person,color: Colors.black,size: 40,),
backgroundColor: Colors.white54,
                ),

                 Form(
key: _formKey ,

                   child: Container(
                       width: MediaQuery.of(context).size.width*0.75,
                       height: MediaQuery.of(context).size.width*0.23,

                       child: CustomTextField(label: Icons.nightlight_outlined, hint: "Email@gmail.c...", helper: "",control: email,)),
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width*0.75,
                     height: MediaQuery.of(context).size.width*0.23,


                     child: CustomTextField(label: Icons.nightlight_outlined, hint: " Paswword", helper: "",control: password ,)),

                 isLogonOrSingUp?        Container(
                     width: MediaQuery.of(context).size.width*0.75,
                     height: MediaQuery.of(context).size.width*0.23,


                     child: CustomTextField(label: Icons.nightlight_outlined, hint: "Agen Password", helper: "",control: agenPass,)):Text(""),
                 isLogonOrSingUp?        Container(
                     width: MediaQuery.of(context).size.width*0.75,
                     height: MediaQuery.of(context).size.width*0.23,


                     child: CustomTextField(label: Icons.nightlight_outlined, hint: "First Name", helper: "",control: fierstName,)):Text(""),

                 isLogonOrSingUp?        Container(
                     width: MediaQuery.of(context).size.width*0.75,
                     height: MediaQuery.of(context).size.width*0.23,


                     child: CustomTextField(label: Icons.nightlight_outlined, hint: "Last Name", helper: "" ,control: lastName,)):Text("")



               ],


               ),
             ),

                   InkWell(
                       onTap: () {
                         setState(() {
                           isLogonOrSingUp=!isLogonOrSingUp;
                         });
                       },
                       child:isLogonOrSingUp? Text("Login  ?",style: TextStyle(color: Colors.blueAccent)):Text("Create an Account  ?",style: TextStyle(color: Colors.blueAccent,fontSize: 15),))
               , SizedBox(height: 13,)
               , InkWell(onTap: () {
                 setState(() {
                   isLogonOrSingUp=false;
                 });
               },child: Text("Forgot Your Password ?",style: TextStyle(color: Colors.blueAccent))),

SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    isLogonOrSingUp?     InkWell(
                     onTap: () => singup(email.text, password.text, fierstName.text, String, lastName.text),
                     child: Container(
                       width: MediaQuery.of(context).size.width*0.50,
                       height: MediaQuery.of(context).size.width*0.23,

                       decoration:BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.indigo.withOpacity(0.80),) ,

                       child: Center(child: Text("Sing Up",style: Stayltext.textStyle.copyWith(fontSize: 20),)),
                     )
                   ): InkWell(
                     onTap: () => chickAacont(),
                     child: Container(
                       width: MediaQuery.of(context).size.width*0.50,
                       height: MediaQuery.of(context).size.width*0.23,

                       decoration:BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.indigo.withOpacity(0.80),) ,

                       child: Center(child: Text("Laog in",style: Stayltext.textStyle.copyWith(fontSize: 20),)),
                     ),
                   )

                  ],
                )

            ],)

            ),


          ],
        ),
      ) ,


    );
  }
}