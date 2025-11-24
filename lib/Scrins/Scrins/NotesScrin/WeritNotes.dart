import 'package:flutter/material.dart';
import 'package:orojct/Scrins/Scrins/NotesScrin/Notes.dart';
import 'Notes.dart';


class Weritnotes extends StatefulWidget {


  @override
  State<Weritnotes> createState() => _WeritnotesState();
}

class _WeritnotesState extends State<Weritnotes> {

  //saveNotes ?u;
  @override
  String titel = "";
  String textNots = "";


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(titel),

      ),

      body: Form(

        child: Column(
          children: [
            TextFormField(

              onSaved: (newValue) {
                titel = newValue!;

              },


            ),

            TextFormField(

              onSaved: (newValue) {
                textNots = newValue!;
              },


            ),


          ],
        ),


      ),


    );
  }

   ss(saveNotes p ){

    return saveNotes(noee: textNots, titelNotes:titel );

  }
}



