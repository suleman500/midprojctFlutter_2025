import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class Explorstorg extends StatefulWidget {

  @override
  State<Explorstorg> createState() => _ExplorstorgState();
}

class _ExplorstorgState extends State<Explorstorg> {


  String ?imUrl;

  @override

  Widget build(BuildContext context) {

    //  الباكيااات
    final storagRef=FirebaseStorage.instance.ref();
    final imagee=storagRef.child("image");

    return Scaffold(

      appBar: AppBar(title: Text("Storeg"),),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [

imUrl!=null? Image.network("$imUrl"):Container(
  
  child: Text("null"),
  
),


          ElevatedButton(onPressed: () async{


 imUrl= await storagRef.child('2s53gwzmj6ipzf0mda88n22mr.webp').getDownloadURL();

            //final ImagePicker picker = ImagePicker();
          //final img = await picker.pickImage(source:ImageSource.gallery );
setState(() {

});
          //  هون بضل يرفع على نفس ملف المشار الي هو اميج
          //final photos1=storagRef.child("imagee/${img!.name}");
         // photos1.putFile(File(img!.path));
          }, child: Text("Ublod Emeg"))


        ],),
      ),
    );
  }
}