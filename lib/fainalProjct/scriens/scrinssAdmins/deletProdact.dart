import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/widget/costomProdactAdmein.dart';
import 'package:orojct/fainalProjct/widget/costom_games.dart';
import 'package:orojct/fainalProjct/widget/costom_prodact.dart';

class Deletprodact extends StatefulWidget {
  @override
  State<Deletprodact> createState() => _DeletprodactState();
}

class _DeletprodactState extends State<Deletprodact> {

  final TextEditingController searchController = TextEditingController();
  bool truSherch = false;

  Future<void> dleteItem(String name, String id) async {
    await FirebaseFirestore.instance.collection("products").doc(id).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('don delete Item'), backgroundColor: Colors.green),
    );
    setState(() {});
  }

  void showdelet(String name, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm deletion"),
        content: Text("Are you sure about deleting?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),

          TextButton(
            onPressed: () {
              Navigator.pop(context);
              dleteItem(name, id);
            },
            child: Text('delet', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [


            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 60)],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: GestureDetector(
                    onTap: () {},

                    child: Icon(Icons.search),
                  ),
                ),
                controller: searchController,
                onChanged: (value) {


                  setState(() {
                    searchController.text=value;
                    truSherch = value!.isNotEmpty;
                  });

                },
              ),
            ),




            truSherch?
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("nooo  Prodact"));
                } else {
                  final allprodact = snapshot.data!.docs
                      .map((e) => ModelProduct.fromMap(e.data(), e.id))
                      .where(
                        (o) =>
                   o.namePrdact.toLowerCase().contains(searchController.text)
                  )
                      .toList();
                  return Container(
                    child: GridView.builder(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: allprodact.length,
                      itemBuilder: (context, index) => Costomprodactadmein(
                        games: allprodact[index],
                        ifvi: allprodact[index].isFav,
                        actionIcon: Icons.delete,
                        onIconTap: () {
                          showdelet(
                            allprodact[index].namePrdact,
                            allprodact[index].id!,
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            )






                :StreamBuilder(
              stream: FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("nooo  Prodact"));
                } else {
                  final allprodact = snapshot.data!.docs
                      .map((e) => ModelProduct.fromMap(e.data(), e.id))
                      .where(
                        (o) =>
                            o.type == "topgame" ||
                            o.type == "soongame" ||
                            o.type == "product",
                      )
                      .toList();
                  return Container(
                    child: GridView.builder(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: allprodact.length,
                      itemBuilder: (context, index) => Costomprodactadmein(
                        games: allprodact[index],
                        ifvi: allprodact[index].isFav,
                        actionIcon: Icons.delete,
                        onIconTap: () {
                          showdelet(
                            allprodact[index].namePrdact,
                            allprodact[index].id!,
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
