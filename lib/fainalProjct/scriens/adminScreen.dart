import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/models/slider.dart';
import 'package:orojct/fainalProjct/scriens/login.dart';
import 'package:orojct/fainalProjct/scriens/scrinssAdmins/addprodact.dart';
import 'package:orojct/fainalProjct/scriens/scrinssAdmins/apdatProdact.dart';
import 'package:orojct/fainalProjct/scriens/scrinssAdmins/deletProdact.dart';
import 'package:orojct/fainalProjct/stayle/shadwoStayle.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orojct/fainalProjct/widget/costomslider.dart';



class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  final firebaseAuth = FirebaseAuth.instance;
  Future<void>addAdvertisements(ModelSlider photo )async{

  final docRif= FirebaseFirestore.instance.collection("Advertisements").doc();
photo=photo.copyWith(id: docRif.id);
await docRif.set(photo.toMap());
idPhoto=docRif.id;
setState(() {

});

    
  }
  Future<void>deletAdvertisements(String id, String uRl) async{

      final ref = FirebaseStorage.instance.refFromURL(uRl);
      await ref.delete();


      await FirebaseFirestore.instance
          .collection("Advertisements")
          .doc(id)
          .delete();

      setState(() {
        photoAdv = null;
        idPhoto=null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(" The image has been deleted successfully")));





  }

  final stoRef = FirebaseStorage.instance.ref();
String? photoAdv=null;
String? idPhoto;

  Map<String, Widget> pagList = {
    "Add": Addprodact(),
    "Delete": Deletprodact(),
    "Update": Apdatprodact(),
  };


  Map<String, IconData> namAndIcons = {
    "Add": Icons.add,
    "Delete": Icons.delete,
    "Update": Icons.system_update_alt,
  };


  @override
  Widget build(BuildContext context) {


   return Scaffold(
     appBar: AppBar(centerTitle: true,title:Text(
       "ARENAGamesSHOP",
       style: TextStyle(
           color: Colors.blue.shade300,
           fontSize: 20,
           fontWeight: FontWeight.bold,
           fontFamily: "rrt"
       ),
     ),),
     body: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [


           SizedBox(height: MediaQuery.of(context).size.height*0.02,),

           InkWell(
             onTap: ()async {
               ImagePicker phto=ImagePicker();
               final imeg=await phto.pickImage(source: ImageSource.gallery);
               String naemOrinal=imeg!.name;
               String taim= DateTime.now().millisecondsSinceEpoch.toString();
               String newName="$naemOrinal-$taim";
               final pathPhoto=stoRef.child("Advertisements/$newName");
              await pathPhoto.putFile(File(imeg.path));
              String uRLphto=await pathPhoto.getDownloadURL();
              setState(() {
                photoAdv=uRLphto;
              });
               
             },

             child: Container(
               height: MediaQuery.of(context).size.height*0.15,
               decoration: BoxDecoration(
                 color: Colors.blue.shade50,
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(color: Colors.blue.shade200),
               ),
               child: Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.cloud_upload, size: 32, color: Colors.blue),
                     SizedBox(height: 8),
                     Text(
                       "Upload an advertisement",
                       style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                         color: Colors.blue.shade700,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           )
           ,


Column(
  children: [
    Container(child:




    photoAdv==null?
        Text("Upload no photo")


        :Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

              child: Image.network(photoAdv!)),
        )




    ),

    Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        InkWell(
            onTap: () {
              
              if(photoAdv==null){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Add a picture!!")));

              }
              else{

                ModelSlider newphto=ModelSlider( namePhtoos:photoAdv!);
                addAdvertisements(newphto);

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Uploaded successfully")));
                setState(() {
                  photoAdv=null;
                  idPhoto=null;
                });


              }

            },

            child: Container( color: Colors.blue.shade50, child: Icon(Icons.check_circle))),

        InkWell(

            onTap: ()async {


              if(photoAdv!=null&&idPhoto!=null){

                deletAdvertisements(idPhoto!,photoAdv!);

              }

            },
            child: Container(height: 50, color: Colors.grey.shade100, child: Icon(Icons.cancel))),
      ],
    ),

    Container(
      height: 1,
      width: double.infinity,
      color: Colors.black,
    ),



    Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Ads have been added", style: Textstayle.textStyle3),
                  Icon(
                    Icons.navigate_next_outlined,
                    shadows: [Shadwostayle.statyl1],
                  ),
                ],
              ),
StreamBuilder(stream: FirebaseFirestore.instance.collection("Advertisements").snapshots(), builder: (context, snapshot) {
  final advphoto=snapshot.data!.docs.map((e) => ModelSlider.fromMap(e.data(),e.id)).toList();
  if (snapshot.connectionState == ConnectionState.waiting &&
      !snapshot.hasData) {
    return Center(child: CircularProgressIndicator());
  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
    return Center(child: Text("nooo  Prodact"));
  }

  return Container(

    height: MediaQuery.of(context).size.height*0.09,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: advphoto.length,
    itemExtent: MediaQuery.of(context).size.height*0.30

    ,itemBuilder: (context, index) => InkWell(

        onTap:() {
          showDialog(

              context: context, builder: (context) => AlertDialog(

            title: Text("AdV"),

            content: Container(
              height:MediaQuery.of(context).size.height*0.30 ,
              child: Column(children: [

                CostomSliderr(phto: advphoto[index]),
                TextButton(
                  onPressed: ()async {

                 await   deletAdvertisements(advphoto[index].id!,advphoto[index].namePhtoos);
                 return Navigator.pop(context);

                  } ,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ),

              ],),
            ),


            
          ));
        } ,

        child: CostomSliderr(phto: advphoto[index])),),
  );
},)

            ],
          ),
        ),
      ),
    ),

  ],
),
SizedBox(height: MediaQuery.of(context).size.height*0.1,),
           Container(
             height: 1,
             width: double.infinity,
             color: Colors.black,
           ),
           ListView.builder(

             shrinkWrap: true,
             physics: AlwaysScrollableScrollPhysics(),
             itemCount: pages.length,
           
             itemBuilder: (context, index) {
           
               return Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: ListTile(
                   selectedColor: Colors.blue,
                   leading: Icon(pages[index].icon),
                   title:Text(pages[index].name) ,

                            dense: true,
                   autofocus: true,


                   onTap: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => pages[index].page));
                   },


                 ),
               );
           
           
             }
           
           ,),

           ElevatedButton(
             onPressed: ()async {
              await firebaseAuth.signOut();
              // await GoogleSignIn().signOut();


              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Loginaccont()),
                    (route) => false,
              );


              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Logged out successfully")),
              );


             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.red,
             ),
             child: Text("Logout", style: TextStyle(color: Colors.white)),
           ),

         ],
       ),
     ),
     
   );





}


}







class PageItem {
  final String name;
  final Widget page;
  final IconData icon;

  PageItem({
    required this.name,
    required this.page,
    required this.icon,
  });
}


List<PageItem> pages = [
  PageItem(name: "Add", page: Addprodact(), icon: Icons.add),
  PageItem(name: "Delete", page: Deletprodact(), icon: Icons.delete),
  PageItem(name: "Update", page: Apdatprodact(), icon: Icons.system_update_alt),
];