import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/widget/costomProdactAdmein.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';


class Apdatprodact extends StatefulWidget {

  @override
  State<Apdatprodact> createState() => _ApdatprodactState();
}

class _ApdatprodactState extends State<Apdatprodact> {



  final TextEditingController nameController = TextEditingController();

  final TextEditingController spuNamesController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController photoController = TextEditingController();

  final TextEditingController descController = TextEditingController();










  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(


        title: Text('Edit Products'),


      ),
      body:
      StreamBuilder(stream:FirebaseFirestore.instance.collection("products").snapshots() , builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("nooo  Prodact"));
          }
          else{
            final allprodact=snapshot.data!.docs.map((e) => ModelProduct.fromMap(e.data(), e.id),).where((o) =>o.type=="topgame"||o.type=="soongame"||o.type=="product" ,).toList();
            return Container(

              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemCount: allprodact.length,itemBuilder: (context, index) => Costomprodactadmein(games: allprodact[index], ifvi: allprodact[index].isFav,actionIcon: Icons.edit_outlined,onIconTap:() {

                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text("Confirm deletion"),
                    content: SingleChildScrollView(child:Column(children: [


                        CustomTextField(label:Icons.production_quantity_limits , hint:"", helper: "Enter the new product name",suffix: Text("${allprodact[index].namePrdact}"),control:nameController ,obscureText: false,),
                        CustomTextField(label:Icons.price_change_outlined , hint:"", helper: "The new price",suffix: Text("${allprodact[index].price}"),control:priceController ,obscureText: false,),
                        CustomTextField(label:Icons.description_rounded , hint:"", helper: "The new description",suffix: Text("${allprodact[index].discrbion}"),control:descController ,obscureText: false,),
                        CustomTextField(label:Icons.description_rounded , hint:"", helper: "The new sub naems",suffix: Text("${allprodact[index].spuNames}"),control:spuNamesController ,obscureText: false,),

                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),

                        ),



                        TextButton(
                          onPressed: () {

                            FirebaseFirestore.instance.collection("products").doc(allprodact[index].id).update({

                              "discrbion":descController.text.isEmpty? allprodact[index].discrbion: descController.text,

                              "namePrdact":nameController.text.isEmpty? allprodact[index].namePrdact: nameController.text,


                              "price":priceController.text.isEmpty? allprodact[index].price:  double.parse(priceController.text),
                              "spuNames":spuNamesController.text.isEmpty? allprodact[index].spuNames: spuNamesController.text
                            });


                            descController.clear();
                            nameController.clear();
                            priceController.clear();
                            spuNamesController.clear();


                            Navigator.pop(context);
                          },
                          child: Text('Updut', style: TextStyle(color: Colors.red)),
                        ),







                    ],),

                    )

                  ),);









              },),) ,

            );

          }



        },),




    );
  }
}