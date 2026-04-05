import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Addprodact extends StatefulWidget {

  @override
  State<Addprodact> createState() => _AddprodactState();
}

class _AddprodactState extends State<Addprodact> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController spuNamesController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController photoController = TextEditingController();

  final TextEditingController descController = TextEditingController();
  String ?kayPhoto;

  Future<void>addProdact(ModelProduct proda)async{
    // doc  يعني لمستخدم معين
    final docRif=FirebaseFirestore.instance.collection("products").doc();
    proda=proda.copyWith(id:docRif.id);
    await docRif.set(proda.toMap());
  }

  String selectedType = 'product';

  List<String> types = ['product', 'topgame', 'soongame'];
final stoRef=FirebaseStorage.instance.ref();
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة منتج جديد'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              CustomTextField(
                label: Icons.shopping_bag,
                hint: "اسم المنتج",
                helper: "",
                control: nameController,
                obscureText: false,
              ),
              SizedBox(height: 15),


              CustomTextField(
                label: Icons.category,
                hint: "التصنيف (مثال: Gaming Consoles)",
                helper: "",
                control: spuNamesController,
                obscureText: false,
              ),
              SizedBox(height: 15),


              CustomTextField(
                label: Icons.attach_money,
                hint: "السعر",
                helper: "",
                control: priceController,
                keyboardType: TextInputType.number,
                obscureText: false,
              ),
              SizedBox(height: 15),







           /*   CustomTextField(
                label: Icons.image,
                hint: "رابط الصورة",
                helper: "",
                control: photoController,
                obscureText: false,
              ),*/
              SizedBox(height: 15),


              CustomTextField(
                label: Icons.description,
                hint: "الوصف",
                helper: "",
                control: descController,
                obscureText: false,
              ),
              SizedBox(height: 15),


              Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedType,
                  decoration: InputDecoration(
                    label: Icon(Icons.label),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  items: types.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      selectedType = newvalue!;
                    });
                  },
                ),
              ),

              ElevatedButton(onPressed: ()async {
                final ImagePicker picker = ImagePicker();
                final imeg= await picker.pickImage(source: ImageSource.gallery);
                //  خزنت الاسم الاصلي
                String nemeOrig=imeg!.name;
                // هون اعملت اسم من الوقت
                String time = DateTime.now().millisecondsSinceEpoch.toString();
                // هون دمحت الاسم مع الوقت
                String newName="$time-$nemeOrig";

                final photo=stoRef.child("$selectedType/$newName");
//  هون رفعت الاسم من photo و داخلهم الاصوره الاصليه  الي هي imeg
                await photo.putFile((File(imeg!.path)));
                String urlImeg= await photo.getDownloadURL();
                setState(() {
                kayPhoto =urlImeg;
                });


              }, child:Text("Uplod Image Photo prodac") ),




              SizedBox(height: 30),


              ElevatedButton(
                onPressed: () {




                  ModelProduct newprod = ModelProduct(
                      namePrdact: nameController.text,
                      spuNames: spuNamesController.text,
                      photoProdact: kayPhoto!,
                      isFav: false,
                      type: selectedType,
                      price: double.parse(priceController.text),
                      discrbion: descController.text);
                  addProdact(newprod);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("The active image has been uploaded")));

                  nameController.clear();
                  spuNamesController.clear();
                  priceController.clear();
                  descController.clear();
                  setState(() {
                    kayPhoto = null;
                  });


                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'إضافة المنتج',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}