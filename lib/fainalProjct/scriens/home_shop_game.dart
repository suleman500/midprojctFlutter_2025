import 'dart:async';

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
import 'package:orojct/fainalProjct/widget/costom_games.dart';
import 'package:orojct/fainalProjct/widget/costom_prodact.dart';
import 'package:orojct/fainalProjct/widget/costomslider.dart';

import '../models/prodactAll.dart';
import '../stayle/colorStayle.dart';
import '../models/Categories.dart';
import '../widget/costomCatgeres.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart'
    hide CarouselSlider, CarouselOptions;
import 'package:lottie/lottie.dart';

class HomeShopGame extends StatefulWidget {
  @override
  String pass;
  String emails;
  String firstName;
  String lastName;


  double? balance;

  HomeShopGame({ required this.pass,required this.emails,required this.firstName,required this.lastName,required  this.balance});

  State<HomeShopGame> createState() => _HomepagState();
}

class _HomepagState extends State<HomeShopGame> {
  TextEditingController searchController = TextEditingController();
  List<ModelProduct> filteredItems = [];
  int selectIndex = 0;
  bool isCostomGames = false;
  bool isUpcomingGames = false;
  bool isCostomProdact = false;
  bool preOder = true;
  bool ggames = true;
  bool slider=false;

  bool showSearchResults = false;

  void initState() {
    super.initState();
    isCostomGames = true;
    isUpcomingGames = true;
    isCostomProdact = true;
    preOder = false;
    ggames = false;
    filteredItems = List.from(allList);
    slider=true;
  }

  searchProducts(String name) {
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

  isFavrtUpcomingGamesList(int x) {
    setState(() {
      UpcomingGamesList[x] = UpcomingGamesList[x].copyWith(
        isFav: !UpcomingGamesList[x].isFav,
      );
      // print(UpcomingGamesList[x].isFav);
    });
  }

  isFavrtUProdact(int x) {
    setState(() {
      GearList[x] = GearList[x].copyWith(isFav: !GearList[x].isFav);
      // print(UpcomingGamesList[x].isFav);
    });
  }

  isFavrtGamest(int x) {
    setState(() {
      GamesList[x] = GamesList[x].copyWith(isFav: !GamesList[x].isFav);
      //print(GamesList[x].isFav);
    });
  }

  isFavrtGearList(int x) {
    setState(() {
      GearList[x] = GearList[x].copyWith(isFav: !GearList[x].isFav);
    });
  }

  //  هون عشان الفرزز بين المنجات
  chickIndex(int index) {
    setState(() {
      switch (index) {
        case 0:
          isCostomGames = true;
          isUpcomingGames = true;
          isCostomProdact = true;
          preOder = false;
          ggames = false;
          slider=true;
          break;
        case 1:
          isCostomGames = false;
          isUpcomingGames = false;
          isCostomProdact = true;
          slider=false;
          break;
        case 2:
          isCostomGames = true;
          isUpcomingGames = false;
          isCostomProdact = false;
          ggames = true;
          slider=false;
          break;
        case 3:
          isCostomGames = false;
          isUpcomingGames = true;
          isCostomProdact = false;
          preOder = true;
          slider=false;
          break;
      }
    });
  }

  // هون السؤال ...................**************

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,

                //decoration: StyleColor.style1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => Myprofaile(email:widget.emails!, password: widget.pass!, ferstName:widget.firstName!, lastName:widget.lastName!, balance:widget.balance!,),));
                            },

                            child: ListTile(
                              title: CircleAvatar(
                                child: Text(widget.firstName!.substring(0, 3)!),
                              ),
                              subtitle: Text(widget.emails!),
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
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
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

              // height: ,
              Container(
                width: MediaQuery.of(context).size.width,

                child: CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                    autoPlay: true,
                    aspectRatio: 0.2,

                    animateToClosest: true,
                     enlargeCenterPage: true,
                   // autoPlayCurve: Curves.easeInToLinear,
                    pauseAutoPlayOnTouch: true,
                   // disableCenter: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 5),
                    height: MediaQuery.of(context).size.height * 0.23,
                    viewportFraction: 0.88,
                    onPageChanged: (index, reason) {
                      setState(() {});
                    },
                  ),

                  items: phtosAdss.map((phto) {
                    return Container(
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(width: 3.0,color:Colors.blue, )),
                      child: CostomSliderr(phto: phto),
                    );
                  }).toList(),
                ),
              ),

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
                    searchProducts(newValue!);
                  },
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.width * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  reverse: true,
                  itemExtent: MediaQuery.of(context).size.width * 0.25,
                  itemBuilder: (context, index) {
                    return costomCatger(
                      gatoger: categoriesList[index],
                      voidCallback: () => chickIndex(index),
                    );
                  },
                ),
              ),









              isCostomGames
                  ? Container(
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
                    )
                  : Text(""),






              isCostomGames
                  ? ggames
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.80,

                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                              itemCount: GamesList.length,
                              itemBuilder: (context, index) {
                                return CostomGames(
                                  games: GamesList[index],
                                  onTa7p: () => isFavrtGamest(index),
                                );
                              },
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.20,

                            padding: EdgeInsets.all(1),
                            child: ListView.builder(
                              reverse: true,
                              scrollDirection: Axis.horizontal,

                              // itemExtent: 300,
                              itemCount: GamesList.length,
                              itemBuilder: (context, index) {
                                return CostomGames(
                                  games: GamesList[index],
                                  onTa7p: () => isFavrtGamest(index),
                                );
                              },
                            ),
                          ): Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.90,








                child: CarouselSlider(
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    clipBehavior: Clip.antiAlias,
                    //disableCenter: true,
                    autoPlay: true,
                    pageSnapping: true,
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.easeInToLinear,
                    pauseAutoPlayOnTouch: true,
                    disableCenter: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds:6 ),
                    height: MediaQuery.of(context).size.height * 0.10,

                    viewportFraction: 0.90,
                    aspectRatio: 16 / 4,
                    onPageChanged: (index, reason) {
                      setState(() {});
                    },
                  ),

                  items: slid.map((phto) {
                    return Container(
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(width: 3.0,color:Colors.blue, )),
                      child: CostomSliderr(phto: phto),
                    );
                  }).toList(),
                ),
              ),


           slider?   Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.90,








                child: CarouselSlider(
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    clipBehavior: Clip.antiAlias,
                    //disableCenter: true,
                    autoPlay: true,
                    pageSnapping: true,
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.easeInToLinear,
                    pauseAutoPlayOnTouch: true,
                    disableCenter: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds:6 ),
                    height: MediaQuery.of(context).size.height * 0.10,

                    viewportFraction: 0.90,
                    aspectRatio: 16 / 4,
                    onPageChanged: (index, reason) {
                      setState(() {});
                    },
                  ),

                  items: slid.map((phto) {
                    return Container(
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(width: 3.0,color:Colors.blue, )),
                      child: CostomSliderr(phto: phto),
                    );
                  }).toList(),
                ),
              ):SizedBox(height: 30,),




              isUpcomingGames
                  ? Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Games Soon",
                                  style: Textstayle.textStyle3,
                                ),
                              ),
                              Icon(
                                Icons.navigate_next_outlined,
                                shadows: [Shadwostayle.statyl1],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 0.1,),



            



              isUpcomingGames
                  ? preOder
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.60,

                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                              itemCount: UpcomingGamesList.length,
                              itemBuilder: (context, index) {
                                return CostomGames(
                                  games: UpcomingGamesList[index],
                                  onTa7p: () => isFavrtUpcomingGamesList(index),
                                );
                              },
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            padding: EdgeInsets.all(1),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,

                              itemCount: UpcomingGamesList.length,

                              itemBuilder: (context, index) {
                                return CostomGames(
                                  games: UpcomingGamesList[index],
                                  onTa7p: () => isFavrtUpcomingGamesList(index),
                                );
                              },
                            ),
                          )
                  : SizedBox(height: 40,),










              isCostomProdact
                  ? Align(
                      alignment: Alignment.topLeft,

                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.10,
                            width: MediaQuery.of(context).size.width * 0.34,
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Top Prodact",
                                  style: Textstayle.textStyle3,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.navigate_next_outlined,
                            shadows: [Shadwostayle.statyl1],
                          ),
                        ],
                      ),
                    )
                  : SizedBox(height: 20,),

              isCostomProdact
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.60,
                      padding: EdgeInsets.all(1),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: GearList.length,
                        itemBuilder: (context, index) {
                          return CostomProdact(
                            moGrd: GearList[index],
                            onTa7p: () => isFavrtUProdact(index),
                          );
                        },
                      ),
                    )
                  : SizedBox(height: 80,),
            ],
          ),
        ),
      ),
    );
  }
}
