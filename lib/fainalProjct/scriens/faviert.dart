import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';

import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costom_games.dart';
import 'package:orojct/fainalProjct/widget/costom_prodact.dart';

class Faviert extends StatefulWidget {
  @override
  State<Faviert> createState() => _FaviertState();
}

class _FaviertState extends State<Faviert> {
  // List<ModelProduct> favList = allList.where((item) => item.isFav == true).toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      body: Column(
        children: [
SizedBox(height: 30,),
          Text(
            "ARENAGamesSHOP",
            style: TextStyle(
                color: Colors.blue.shade300,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "rrt"
            ),
          ),

          Text(
            "Favorite",
            style: TextStyle(
                color: Colors.red.shade300,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: "rrt"
            ),
          ),


          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('userr')
                .doc(uid)
                .collection("faiv")
                .snapshots(),
            builder: (context, snapshotfavir) {
              if (snapshotfavir.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (!snapshotfavir.hasData ||
                  snapshotfavir.data!.docs.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.network(
                      "https://lottie.host/feda6d30-9450-4b78-9f01-3a93948365f7/Y5R9QxEdZa.json",
                    ),
                    Text("NO Requests", style: Textstayle.textStyle),
                  ],
                );
              } else {
                final prodactfiv = snapshotfavir.data!.docs
                    .map((e) => ModelProduct.fromMap(e.data(), e.id))
                    .toList();

                return Expanded(
                  child: ListView.builder(
                    itemCount: prodactfiv.length,

                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(12),
                          child: CostomProdact(
                            moGrd: prodactfiv[index],
                            isFav: prodactfiv[index].isFav,
                            onTa7p: () async {
                              String uid = FirebaseAuth.instance.currentUser!.uid;
                              await FirebaseFirestore.instance
                                  .collection("products")
                                  .doc(prodactfiv[index].id)
                                  .update({"isFav": false});

                              await FirebaseFirestore.instance
                                  .collection("userr")
                                  .doc(uid)
                                  .collection("faiv")
                                  .doc(prodactfiv[index].id)
                                  .delete();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Removed from favorites')),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
