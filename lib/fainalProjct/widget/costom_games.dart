import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/widget/costom_discrbionGames.dart';
import 'package:orojct/orderDetalisPag.dart';
import 'package:page_transition/page_transition.dart';

class CostomGames extends StatefulWidget {
  ModelProduct games;
  VoidCallback? onTa7p;
  bool? ifvi;

  CostomGames({required this.games, this.onTa7p, this.ifvi});

  @override
  State<CostomGames> createState() => _CostomGamesState();
}

class _CostomGamesState extends State<CostomGames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.28,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onLongPress: () {
              showBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: CostomDiscrbiongames(
                      nameProdact: widget.games.namePrdact,
                      photoProdact: widget.games.photoProdact,
                      price: widget.games.price,
                      discrion: widget.games.discrbion!,
                    ),
                  );
                },
              );
            },
            onDoubleTap: widget.onTa7p,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                 // curve: Curves.fastOutSlowIn,
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  child: Orderdetalispag(
                    nameProdact: widget.games.namePrdact,
                    photoProdact: widget.games.photoProdact,
                    price: widget.games.price,
                    discrbion: widget.games.discrbion,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      widget.games.photoProdact,
                      fit: BoxFit.contain,
                    ),
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: Text(
                        "شراء",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.028,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    widget.games.isFav
                        ? Icon(Icons.favorite, size: 18, color: Colors.red)
                        : Icon(Icons.favorite_border, size: 18)
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