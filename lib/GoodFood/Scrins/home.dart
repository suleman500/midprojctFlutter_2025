import 'package:flutter/material.dart';
import 'package:orojct/GoodFood/Widgte/costomFoodCatger.dart';

import '../../midProgct2/Stayle/staylText.dart';
import '../Style/DecrionStayle.dart';
import '../Widgte/costomFood.dart';
import '../modle/modelProdactFood.dart';
import 'detealisScrin.dart';
class Home extends StatefulWidget{
List<Modelproductfood> cart;

Home({required this.cart});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  bool chikk=false;

  List<String> foodCategories = ["All", "Burger", "Salads", "Desserts", "Pizza"];
List <Modelproductfood>catogeriList=[];
List <Modelproductfood>saersh=[];
  saershFromUser(String query){
    List <Modelproductfood>baseList=catogeriList.isEmpty? foodList:catogeriList;
    final result=baseList.where((element) =>element.namePhoto.toLowerCase().contains(query),).toList();
setState(() {
  saersh=result;
});

  }

searchInCatgery(String type){
  final filtered=foodList.where((element) => element.catogory.toLowerCase()==type.toLowerCase()).toList();

if(type.toLowerCase()=="all"){
  setState(() {
    catogeriList=[];
    saersh= foodList;
  });
}
else{

  setState(() {
    catogeriList=filtered;
    saersh=filtered;
  });

}
}




  //??? هون
  //final filtered=foodList.where((element) => element.catogory.toLowerCase()==type.toLowerCase()).toList();


  @override
  //  او اشي بتنفذذ
  void initState() {
    saersh = foodList;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
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
                        onChanged: (value) {
                          saershFromUser(value);
                        },
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
                  return InkWell(
                  onTap:() => searchInCatgery(foodCategories[index])

                  ,child: Costomfoodcatger(text: foodCategories[index]));
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
              itemCount:  saersh.length,
              itemBuilder: (context, index) {
                return Costomfood(food:  saersh[index],onTap: () {

                  int indesOFMeel=foodList.indexWhere((e) => e.title==saersh[index].title);




if(indesOFMeel != -1){
  setState(() {

    foodList[indesOFMeel]=foodList[indesOFMeel].copyWith(
      isFav: !foodList[indesOFMeel].isFav,
    );


  });



}
if(catogeriList.isNotEmpty){
saersh=searchInCatgery(foodCategories[indesOFMeel]);

}
else{
saersh=foodList;

}



                 // print(foodList[index].isFav);

                },
                  onTapCard:() {
Navigator.push(context, MaterialPageRoute(builder: (context) => DetealiSscrin(food:catogeriList.isEmpty?foodList[index]:saersh[index],cart: widget.cart),));
                  } ,
                );
              },
            ),
          ),
        ],
      ),


    );
  }
}