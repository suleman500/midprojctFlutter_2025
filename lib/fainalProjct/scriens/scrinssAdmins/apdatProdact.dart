import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomProdactAdmein.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Apdatprodact extends StatefulWidget {
  @override
  State<Apdatprodact> createState() => _ApdatprodactState();
}

class _ApdatprodactState extends State<Apdatprodact> {

  bool truSherch = false;
  String selectedType = 'product';
  String? uRlphotoNew;

  List<String> types = ['product', 'topgame', 'soongame'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController spuNamesController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController searchController = TextEditingController();


  final stoRef = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Edit Products')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Icon(Icons.games)),
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

            truSherch ?
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());

                }
               else if (!snapshot.hasData || snapshot.data!.docs.isEmpty){
                 return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(

                        child: LottieBuilder.network(
                          "https://lottie.host/feda6d30-9450-4b78-9f01-3a93948365f7/Y5R9QxEdZa.json",
                        ),
                      ),
                      Text("NO Requests", style: Textstayle.textStyle),
                    ],
                  );


                }


                else {
                  final serhProdact = snapshot.data!.docs
                      .map((e) => ModelProduct.fromMap(e.data(), e.id))
                      .where((e) => e.namePrdact.toLowerCase().contains(searchController.text))
                      .toList();

                  return GridView.builder(

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: serhProdact.length,
                    itemBuilder: (context, index) => Costomprodactadmein(
                      games: serhProdact[index],
                      ifvi: serhProdact[index].isFav,
                      actionIcon: Icons.edit_outlined,
                      onIconTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Confirm deletion"),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CustomTextField(
                                    label: Icons.production_quantity_limits,
                                    hint: "",
                                    helper: "Enter the new product name",
                                    suffix: Text("${serhProdact[index].namePrdact}"),
                                    control: nameController,
                                    obscureText: false,
                                  ),
                                  CustomTextField(
                                    label: Icons.price_change_outlined,
                                    hint: "",
                                    helper: "The new price",
                                    suffix: Text("${serhProdact[index].price}"),
                                    control: priceController,
                                    obscureText: false,
                                  ),
                                  CustomTextField(
                                    label: Icons.description_rounded,
                                    hint: "",
                                    helper: "The new description",
                                    suffix: Text("${serhProdact[index].discrbion}"),
                                    control: descController,
                                    obscureText: false,
                                  ),
                                  CustomTextField(
                                    label: Icons.description_rounded,
                                    hint: "",
                                    helper: "The new sub naems",
                                    suffix: Text("${serhProdact[index].spuNames}"),
                                    control: spuNamesController,
                                    obscureText: false,
                                  ),
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
                                  ElevatedButton(
                                    onPressed: () async {
                                      final ImagePicker imepikr = ImagePicker();
                                      final imeg = await imepikr.pickImage(source: ImageSource.gallery);
                                      String oriNaem = imeg!.name;
                                      String taim = DateTime.now().millisecondsSinceEpoch.toString();
                                      String newName = "$oriNaem-$taim";
                                      final photo = stoRef.child("$selectedType/$newName");
                                      await photo.putFile(File(imeg!.path));
                                      String url = await photo.getDownloadURL();
                                      setState(() {
                                        uRlphotoNew = url;
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Image uploaded!"))
                                      );
                                    },
                                    child: Text("New Photo"),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      FirebaseFirestore.instance
                                          .collection("products")
                                          .doc(serhProdact[index].id)
                                          .update({
                                        "discrbion": descController.text.isEmpty
                                            ? serhProdact[index].discrbion
                                            : descController.text,
                                        "namePrdact": nameController.text.isEmpty
                                            ? serhProdact[index].namePrdact
                                            : nameController.text,
                                        "price": priceController.text.isEmpty
                                            ? serhProdact[index].price
                                            : double.parse(priceController.text),
                                        "spuNames": spuNamesController.text.isEmpty
                                            ? serhProdact[index].spuNames
                                            : spuNamesController.text,
                                        "photoProdact": (uRlphotoNew != null && uRlphotoNew!.isNotEmpty && uRlphotoNew != "uploading...")
                                            ? uRlphotoNew!
                                            : (serhProdact[index].photoProdact ?? ""),
                                        "type": selectedType.isEmpty
                                            ? serhProdact[index].type
                                            : selectedType,
                                      });
                                      print(uRlphotoNew);
                                      descController.clear();
                                      nameController.clear();
                                      priceController.clear();
                                      spuNamesController.clear();
                                      setState(() {
                                        uRlphotoNew = null;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Updut', style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ) :
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("nooo  Prodact"));
                } else {
                  final allprodact = snapshot.data!.docs
                      .map((e) => ModelProduct.fromMap(e.data(), e.id))
                      .where((o) => o.type == "topgame" || o.type == "soongame" || o.type == "product")
                      .toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Container(
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
                          actionIcon: Icons.edit_outlined,
                          onIconTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Confirm deletion"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        label: Icons.production_quantity_limits,
                                        hint: "",
                                        helper: "Enter the new product name",
                                        suffix: Text("${allprodact[index].namePrdact}"),
                                        control: nameController,
                                        obscureText: false,
                                      ),
                                      CustomTextField(
                                        label: Icons.price_change_outlined,
                                        hint: "",
                                        helper: "The new price",
                                        suffix: Text("${allprodact[index].price}"),
                                        control: priceController,
                                        obscureText: false,
                                      ),
                                      CustomTextField(
                                        label: Icons.description_rounded,
                                        hint: "",
                                        helper: "The new description",
                                        suffix: Text("${allprodact[index].discrbion}"),
                                        control: descController,
                                        obscureText: false,
                                      ),
                                      CustomTextField(
                                        label: Icons.description_rounded,
                                        hint: "",
                                        helper: "The new sub naems",
                                        suffix: Text("${allprodact[index].spuNames}"),
                                        control: spuNamesController,
                                        obscureText: false,
                                      ),
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
                                      ElevatedButton(
                                        onPressed: () async {
                                          final ImagePicker imepikr = ImagePicker();
                                          final imeg = await imepikr.pickImage(source: ImageSource.gallery);
                                          String oriNaem = imeg!.name;
                                          String taim = DateTime.now().millisecondsSinceEpoch.toString();
                                          String newName = "$oriNaem-$taim";
                                          final photo = stoRef.child("$selectedType/$newName");
                                          await photo.putFile(File(imeg!.path));
                                          String url = await photo.getDownloadURL();
                                          setState(() {
                                            uRlphotoNew = url;
                                          });
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Image uploaded!"))
                                          );
                                        },
                                        child: Text("New Photo"),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          FirebaseFirestore.instance
                                              .collection("products")
                                              .doc(allprodact[index].id)
                                              .update({
                                            "discrbion": descController.text.isEmpty
                                                ? allprodact[index].discrbion
                                                : descController.text,
                                            "namePrdact": nameController.text.isEmpty
                                                ? allprodact[index].namePrdact
                                                : nameController.text,
                                            "price": priceController.text.isEmpty
                                                ? allprodact[index].price
                                                : double.parse(priceController.text),
                                            "spuNames": spuNamesController.text.isEmpty
                                                ? allprodact[index].spuNames
                                                : spuNamesController.text,
                                            "photoProdact": (uRlphotoNew != null && uRlphotoNew!.isNotEmpty && uRlphotoNew != "uploading...")
                                                ? uRlphotoNew!
                                                : (allprodact[index].photoProdact ?? ""),
                                            "type": selectedType.isEmpty
                                                ? allprodact[index].type
                                                : selectedType,
                                          });
                                          print(uRlphotoNew);
                                          descController.clear();
                                          nameController.clear();
                                          priceController.clear();
                                          spuNamesController.clear();
                                          setState(() {
                                            uRlphotoNew = null;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text('Updut', style: TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
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