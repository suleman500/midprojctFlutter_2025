import 'package:flutter/material.dart';
import 'package:orojct/GoodFood/Widgte/CostomWidgtTextFeld.dart';

import '../midProgct2/Stayle/staylText.dart';
import 'Style/DecrionStayle.dart';
import 'Widgte/costomFood.dart';
import 'Widgte/costomFoodCatger.dart';
import 'modle/modelProdactFood.dart';

class Homescreengoodfood extends StatelessWidget {
  List<String> foodCategories = ["All", "Burger", "Drinks", "Desserts"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ListTile(
              title: Text(
                "Good Food",
                style: TextStyle(fontFamily: "rrt", fontSize: 40),
              ),
              subtitle: Text("Order your favourite food"),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 60,
                  decoration: Decrionstayle.styleDecion.copyWith(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFEBEE),
                        Color(0xFFFFCDD2),
                        Color(0xFFEF9A9A),
                        Color(0xFFE57373),
                        Color(0xFFDA6764),
                        Color(0xFFCD635B),
                        Color(0xFFA65E5B),
                      ],
                    ),
                  ),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search),
                              Text(
                                "Seaech",
                                style: Stayltext.textStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          // prefixIcon: Center(child: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(elevation: 8, child: Icon(Icons.filter_alt)),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 100,
                itemCount: foodCategories.length,
                itemBuilder: (context, index) {
                  return Costomfoodcatger(text: foodCategories[index]);
                },
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,

            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 10,
              ),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return Costomfood(food: foodList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
