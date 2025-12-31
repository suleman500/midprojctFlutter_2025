import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/stayle/colorStayle.dart';
import 'package:orojct/fainalProjct/widget/costom_discrbionGames.dart';
import 'package:orojct/orderDetalisPag.dart';
import 'package:page_transition/page_transition.dart';

class CostomGames extends StatefulWidget {
  ModelProduct games;

  CostomGames ({required this.games});

  @override
  State<CostomGames> createState() => _CostomGamesState();
}

class _CostomGamesState extends State<CostomGames> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(

        //radius: 80,
        onLongPress: () {
          showBottomSheet(backgroundColor:Colors.transparent ,context: context ,builder: (context) {
return Container(

    height: MediaQuery.of(context).size.height * 0.50,
  //width: MediaQuery.of(context).size.width * 0.20,
  //color: Colors.white12,
  child:
  CostomDiscrbiongames(
    nameProdact: widget.games.namePrdact,
    photoProdact: widget.games.photoProdact,
    price: widget.games.price,
   discrion: widget.games.discrbion!,

  )

  ,
);

          },);



        },




        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
                curve: Curves.fastOutSlowIn,
                alignment: Alignment.center,
              duration: Duration(milliseconds: 300),

                child:  Orderdetalispag(
                  nameProdact: widget.games.namePrdact,
                  photoProdact: widget.games.photoProdact,
                  price: widget.games.price,


                )

            ),
          );
        },
        child: Container(

          child: Column(
            children: [



              Expanded(

                child:


                Image.asset(
                                       widget.games.photoProdact,
                                     ),


              ),
              Padding(

                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          widget.games.namePrdact,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: "rob",
                      
                          ),
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.blue,),

                              child: Icon(Icons.shopping_cart_checkout_sharp)),
                          InkWell(
                            onTap: () {

                            },

                            child: Container(


                                child: widget.games.isFav? Icon(Icons.favorite) : Icon(Icons.favorite_border)  ),
                          )
                        ],
                      )
                      
                    ],
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