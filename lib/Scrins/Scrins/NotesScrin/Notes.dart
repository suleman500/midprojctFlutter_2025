import 'package:flutter/material.dart';
import '../../../Stayle/spashColer.dart';
import 'WeritNotes.dart';
import 'costomWrit.dart';

class Notes  extends StatefulWidget{



  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override

  List<saveNotes> noteList = [

    saveNotes(noee: "Today", titelNotes: "2025"),
    saveNotes(noee: "8*9=12??", titelNotes: "2027"),

  ];
 String k="";

  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),

      body:Stack(


        children: [

          Container(decoration: Splshcoler.colerSplash2,),


Container(
  child: Image.asset("images/asd112.png"),
  
),


          Positioned(
            top: 150,
            bottom: 0,
            //height: 200,
            left: 0,
            right: 0,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,),itemCount: noteList.length, itemBuilder: (context, index) {
            
            
            return nott(noteList[index]);
            
            
            },),
          ),



          Positioned(

              bottom: 90,
              right: 30

              ,child: IconButton.filled(onPressed: () {
                setState(() {
                  noteList.add(saveNotes(noee: "New Notes", titelNotes: "New Notes"));
                });


            Navigator.push(context,MaterialPageRoute(builder: (context) {







  return Weritnotes();


            },));

          }, icon: Icon(Icons.add_circle))),




        ],

      )






    );



  }
  Widget nott(saveNotes s){

  return  Card(

      child: InkWell(
child: Text(s.titelNotes),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return costomwritWidget(s);

          },));



        },


      ),


    );





  }

  Widget costomwritWidget(saveNotes o) {
    return Scaffold(
      appBar: AppBar(title: Text(o.titelNotes)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              onSaved: (newValue) {
                newValue=k;
              },

            ),

            Text(
              o.noee,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }



}





class saveNotes{
  String titelNotes;
  String noee;
  //Widget writ;
  saveNotes({required this.noee,required this.titelNotes});

}


