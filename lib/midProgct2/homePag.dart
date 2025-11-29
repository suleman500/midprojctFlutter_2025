import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/CostomWidgt/costomGridViwe.dart';
import 'package:orojct/midProgct2/CostomWidgt/costomWidgtPhtoListAds.dart';
import 'package:orojct/midProgct2/CostomWidgt/costomWidgtTopCatgre.dart';
import 'package:orojct/midProgct2/Stayle/staylText.dart';
import 'package:orojct/midProgct2/home_Scrin.dart';
import 'package:orojct/midProgct2/models/modelnAavioinBar.dart';
import 'CostomWidgt/costomWidgtDrawe.dart';
import 'Stayle/staylDrower.dart';
import 'Stayle/styleDcrion.dart';
import 'models/modelGridView.dart';
import 'models/modelPhoto.dart';
import 'models/modelTopCategories.dart';

class Homepag extends StatefulWidget {
  @override
  //String naem;
  //String emails;
  //Homepag({required this.naem,required this.emails});
  State<Homepag> createState() => _HomepagState();
}

class _HomepagState extends State<Homepag> {
int indx =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
drawer:Stayldrower.staylDrower,


      body: SingleChildScrollView(
        child: Column(
          children: [


            Container(

              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,

              decoration: StyleDcrion.stylDorion,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(

                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            decoration:StyleDcrion.stylDorion.copyWith(borderRadius: BorderRadius.circular(60)) ,child: Icon(Icons.person)),
                        ListTile(
                          title: Text("Ali"),
                          subtitle: Text("vcxzxcv@gmail.com"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.notifications_active_outlined),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_bag_rounded),
                      ],
                    ),
                  )
                ],
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
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topCategoriesList.length,
                itemBuilder: (context, index) {
                  return TopCatgerListViwe(gories: topCategoriesList[index]);
                },
              ),
            ),

            SizedBox(height: 20,),

            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.2,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: phtosAds.length * 1000,
                itemBuilder: (context, index) {
                  return Costomwidgtphtolistads(phto:phtosAds [index%phtosAds.length]);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(height: 40,width: 100,child: Container(decoration: StyleDcrion.stylDorion,child: Center(child: Text("Top Prodact",))),),
            ),

            Container(

              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: gameStoreProducts.length,
                itemBuilder: (context, index) {
                  return CostomGridViwer(moGrd: gameStoreProducts[index]);
                },
              ),
            ),


          ],

        ),

      ),
      bottomNavigationBar: BottomNavigationBar(

          onTap: (newIndx) {
            setState(() {
              indx=newIndx;
            });


          },
          currentIndex: indx,
          items: botinNavionBar.map((e) => BottomNavigationBarItem(icon: Icon(e.icons),label: e.label,),).toList()),


    );
  }
}



