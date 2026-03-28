import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/models/slider.dart';
import 'package:orojct/fainalProjct/scriens/Pagnotifications.dart';
import 'package:orojct/fainalProjct/scriens/myProfaile.dart';
import 'package:orojct/fainalProjct/scriens/pageSearsch.dart';
import 'package:orojct/fainalProjct/scriens/shopping_cart.dart';
import 'package:orojct/fainalProjct/stayle/shadwoStayle.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomAcionsIcons.dart';
import 'package:orojct/fainalProjct/widget/costomComentParson.dart';
import 'package:orojct/fainalProjct/widget/costom_games.dart';
import 'package:orojct/fainalProjct/widget/costom_prodact.dart';
import 'package:orojct/fainalProjct/widget/costomslider.dart';
import '../models/prodactAll.dart';
import '../stayle/colorStayle.dart';
import '../models/Categories.dart';
import '../widget/costomCatgeres.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:carousel_slider/carousel_slider.dart'
    hide CarouselSlider, CarouselOptions;
import 'package:lottie/lottie.dart';

class HomeShopGame extends StatefulWidget {
  @override
  State<HomeShopGame> createState() => _HomepagState();
}

class _HomepagState extends State<HomeShopGame> {
  TextEditingController searchController = TextEditingController();
  List<ModelProduct> filteredItems = [];
  int selectIndex = 0;
  bool showSearchResults = false;
  String selectedItem = "All";
  String sershText = "";
  bool fiv = false;

  //List<ModelProduct> products = allList.where((item) => item.type == "product").toList();
  //List<ModelProduct> topGames = allList.where((item) => item.type == "top_game").toList();
  //List<ModelProduct> soonGames = allList.where((item) => item.type == "soon_game").toList();

  //final userA=FirebaseAuth.instance.currentUser;
  void initState() {
    super.initState();
  }

  Future<void> addfavirte(ModelProduct prodact, bool isFa) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("products")
        .doc(prodact.id)
        .update({"isFav": isFa});
    if (isFa) {
      await FirebaseFirestore.instance
          .collection("userr")
          .doc(uid)
          .collection('faiv')
          .doc(prodact.id)
          .set(prodact.toMap());
    } else {
      await FirebaseFirestore.instance
          .collection("userr")
          .doc(uid)
          .collection("faiv")
          .doc(prodact.id)
          .delete();
    }
  }

  /*searchProducts(String name) {
    setState(() {
      if (filteredItems.isNotEmpty) {
        showSearchResults = true;
        filteredItems = allList.where((e) {
          return e.namePrdact.toLowerCase().contains(name.toLowerCase());
        }).toList();
      } else {
        filteredItems = List.from(allList);
        showSearchResults = false;
      }
    });
  }

  void toggleFav(int index) {
    setState(() {
      allList[index] = allList[index].copyWith(
        isFav: !allList[index].isFav,
      );
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // الهيدر
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                           // onTap:,
                            child: ListTile(
                              title: CircleAvatar(
                                  child: Text("{userA!.displayName}")),
                              subtitle: Text("0"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Costomacionsicons(
                            icon: Icons.notifications_active_outlined,
                            page: Pagnotifications(),
                          ),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.03,
                          ),
                          Costomacionsicons(
                            icon: Icons.support_agent_outlined,
                            page: Pagnotifications(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // CarouselSlider العلوي
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                    autoPlay: true,
                    aspectRatio: 0.2,
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    pauseAutoPlayOnTouch: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 5),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.23,
                    viewportFraction: 0.88,
                    onPageChanged: (index, reason) {
                      setState(() {});
                    },
                  ),
                  items: phtosAdss.map((phto) {
                    return Container(child: CostomSliderr(phto: phto));
                  }).toList(),
                ),
              ),

              // حقل البحث
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Pagesearsch(prodact: filteredItems),
                          ),
                        );
                      },
                      child: Icon(Icons.search),
                    ),
                  ),
                  controller: searchController,
                  onSaved: (newValue) {
                    // searchProducts(newValue!);
                  },
                ),
              ),

              // التصنيفات
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  reverse: true,
                  itemExtent: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                  itemBuilder: (context, index) {
                    return costomCatger(
                      gatoger: categoriesList[index],
                      voidCallback: () {
                        //  وهون رح اصنف المنتجات
                      },
                    );
                  },
                ),
              ),
              // قسم Top Games (ListView أفق
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Top Games", style: Textstayle.textStyle3),

                        Icon(
                          Icons.navigate_next_outlined,
                          shadows: [Shadwostayle.statyl1],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.16,
                child:
                //  عشان المنتجات
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("nooo  Prodact"));
                    } else {
                      final top_game = snapshot.data!.docs
                          .map((e) => ModelProduct.fromMap(e.data(), e.id))
                          .where((e) => e.type == "topgame")
                          .toList();
                      return Container(
                        child: ListView.builder(
                          itemCount: top_game.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              CostomGames(
                                games: top_game[index],
                                ifvi: top_game[index].isFav,
                                onTa7p: () async {
                                  bool isfav = !top_game[index].isFav;
                                  addfavirte(top_game[index], isfav);
                                },
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),

              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Top Soon games", style: Textstayle.textStyle3),

                        Icon(
                          Icons.navigate_next_outlined,
                          shadows: [Shadwostayle.statyl1],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.14,
                child:
                //  عشان المنتجات
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("nooo  Prodact"));
                    } else {
                      final soongame = snapshot.data!.docs
                          .map((e) => ModelProduct.fromMap(e.data(), e.id))
                          .where((e) => e.type == "soongame")
                          .toList();
                      return Container(
                        child: ListView.builder(
                          itemCount: soongame.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              CostomGames(
                                games: soongame[index],
                                ifvi: soongame[index].isFav,
                                onTa7p: () async {
                                  bool isfav = !soongame[index].isFav;
                                  addfavirte(soongame[index], isfav);
                                },
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.08,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.90,
                child: CarouselSlider(
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    clipBehavior: Clip.antiAlias,
                    autoPlay: true,
                    pageSnapping: true,
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.easeInToLinear,
                    pauseAutoPlayOnTouch: true,
                    disableCenter: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 6),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.10,
                    viewportFraction: 0.90,
                    aspectRatio: 16 / 4,
                    onPageChanged: (index, reason) {
                      setState(() {});
                    },
                  ),
                  items: slid.map((phto) {
                    return Container(child: CostomSliderr(phto: phto));
                  }).toList(),
                ),
              ),

              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Top Prodact", style: Textstayle.textStyle3),

                        Icon(
                          Icons.navigate_next_outlined,
                          shadows: [Shadwostayle.statyl1],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,

                child:
                //  عشان المنتجات
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("nooo  Prodact"));
                    } else {
                      final proddu = snapshot.data!.docs
                          .map((e) => ModelProduct.fromMap(e.data(), e.id))
                          .where((e) => e.type == "product")
                          .toList();
                      return Card(
                        child: GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemCount: proddu.length,
                          itemBuilder: (context, index) =>
                              CostomProdact(
                                moGrd: proddu[index],
                                isFav: proddu[index].isFav,
                                onTa7p: () async {
                                  bool isfav = !proddu[index].isFav;
                                  addfavirte(proddu[index], isfav);
                                },
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
