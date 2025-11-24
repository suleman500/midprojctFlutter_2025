import 'package:flutter/material.dart';
import 'package:orojct/Stayle/spashColer.dart';

import 'Scrins/Gamis.dart';
import 'Scrins/Music.dart';
import 'Scrins/NotesScrin/Notes.dart';
import 'Scrins/Setting.dart';
import 'Scrins/cosytoTextFild.dart';
import 'costoElevetedButtn.dart';
import 'modelScrin1.dart';
import 'modelScrin1Listvie.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool loin = true;
  String massegLapelEmail = "";
  String massegLapelPass = "";
  String massegLapelAgenPass="";
  //  بتحقق من اذا كان تسجيل دخول او حاساب جديد
  bool chik = false;
  // بحفظ كلمت السر و كلمت السر
  String ?saveEmail;
  String ?savePass;
  String ?saveNames;
//  عشان التحقق
   bool isEmail=false;
  bool ispass=false;

  List<ITEMS> material = [
    ITEMS(titill: "Gams", sub: "", icco: Icons.games, page: Gamis()),
    ITEMS(titill: "Notes", sub: "", icco: Icons.note, page: Notes()),
    ITEMS(titill: "Store", sub: "", icco: Icons.book, page: Music()),
    ITEMS(titill: "Setings", sub: "", icco: Icons.settings, page: Setting()),
  ];


  chekk(){

    if(ispass==true && isEmail ==true){

      loin =false;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loin
          ? Container(
        decoration:Splshcoler.colerSplash ,
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar( radius: 50,
                backgroundColor: Colors.cyan,
                child: Icon(Icons.person,size: 60,),
              ),



              chik? Expanded(

                child: Costmtextform(iconss: Icons.person,name: "UserNames",onCHanged: (value) {
                  setState(() {
                    if(value.length < 10){

                      saveNames=value;

                    }
                    else {
                      massegLapelPass="plles enter pass length lese of 10";

                    }
                  });


                },),
              ):Text(""),





              Expanded(
                child: Costmtextform(iconss: Icons.email,name: "ASDFFD@hotmail.com",helperr: massegLapelEmail,onCHanged: (value) {
                  setState(() {
                    if(value.contains("@") ==false){
                      massegLapelEmail="pless enter @";

                    }
                    else {
                      massegLapelEmail="good";
                isEmail=true;

                    }
                  });


                },),
              ),


              Expanded(
                child: Costmtextform(iconss: Icons.password,name: "Password",helperr: massegLapelPass,onCHanged: (value) {
                  setState(() {
                    if(value.length < 10){
                      massegLapelPass="good";
                      savePass=value;
                      ispass =true;

                    }
                    else {
                      massegLapelPass="plles enter pass length lese of 10";

                    }
                  });


                },),
              ),

            chik?  Expanded(
              child: Costmtextform(iconss: Icons.password,name: "Agen Password",helperr: massegLapelAgenPass,onCHanged: (value) {
                  setState(() {
                    if(savePass==value){
                      //massegLapelPass="good";
                      savePass=value;
                      massegLapelAgenPass="";
                    }
                    else {
                      //massegLapelPass="plles enter pass length lese of 10";
                      massegLapelAgenPass="Not Semtrk";
                    }
                  });



                },),
            )

                :Text(""),

              Costomelvetod(namme: "SingIn",ccolorr: Colors.cyan,o: () {

setState(() {
  chik=false;
  chekk();


});
              },),


              Costomelvetod(namme: "SingUp",ccolorr: Colors.cyan,o: () {

                setState(() {
                  chik=true;
                  chekk();
                });
              },)











            ],
          ),
        ),
      )
// الصفحه بعد تسجيل الدخول
          : Stack(
        children: [
          Container(decoration: Splshcoler.colerSplash),

          Positioned(
            top: 70,
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Container(
              decoration: Splshcoler.colerSplash2,
              child: ListTile(
                title: Text(saveNames??"", style: TextStyle(color: Colors.black87)),
                subtitle: Text(saveEmail ?? "", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),

          Positioned(
            top: 66,
            right: 60,
            child: MyAcoont(),
          ),

          Positioned(
            top: 250,
            left: 50,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView.builder(
                padding: EdgeInsets.all(5),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: itemlistt.length,
                itemBuilder: (context, index) {
                  return itemList(itemlistt[index]);
                },
              ),
            ),
          ),

          Positioned(
            top: 300,
            left: 50,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
                itemCount: material.length,
                itemBuilder: (context, index) {
                  return itemsListviw(material[index], context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemsListviw(ITEMS list, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => list.page));
        },
        child: Container(
          decoration: Splshcoler.colerSplash3,
          child: ListTile(
            title: Text(list.titill, style: TextStyle(fontSize: 8, color: Colors.white)),
            subtitle: Text(list.sub, style: TextStyle(color: Colors.white)),
            leading: Icon(list.icco),
          ),
        ),
      ),
    );
  }

  Widget itemList(modeliteemlist itemm) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: Splshcoler.colerSplash4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(itemm.name, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget MyAcoont() {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 55,
            child: Icon(Icons.account_circle_outlined, size: 110),
          )
        ],
      ),
    );
  }
}