import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/widget/costom_discrbionGames.dart';
import 'package:orojct/orderDetalisPag.dart';
import 'package:page_transition/page_transition.dart';

class CostomGames extends StatefulWidget {
  ModelProduct games;
  VoidCallback? onTa7p;
  bool? ifvi;
  VoidCallback? onTp;

  CostomGames({required this.games, this.onTa7p, this.ifvi,this.onTp});

  @override
  State<CostomGames> createState() => _CostomGamesState();
}

class _CostomGamesState extends State<CostomGames> {
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Orderdetalispag(nameProdact: widget.games.namePrdact, price: widget.games.price, photoProdact: widget.games.photoProdact,balance: widget.games.price,discrbion: widget.games.discrbion,) ,));
      },

      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                InkWell(
                  onTap: widget.onTa7p ,
                  child: Container(child: widget.games.isFav ? Icon(Icons.favorite, size: 26, color: Colors.red): Icon(Icons.favorite_border, size: 26) ,),
                ),

                Expanded(

                  child: Image.asset(
                    widget.games.photoProdact,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.games.namePrdact,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,


                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    SizedBox(width: 8),





                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "${widget.games.price.toString()}\$",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}