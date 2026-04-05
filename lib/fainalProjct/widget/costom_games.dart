import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/orderDetalisPag.dart';
import 'package:page_transition/page_transition.dart';

class CostomGames extends StatefulWidget {
  ModelProduct games;
  VoidCallback? onTa7p;
  bool? ifvi;
  VoidCallback? onTp;

  CostomGames({required this.games, this.onTa7p, this.ifvi, this.onTp});

  @override
  State<CostomGames> createState() => _CostomGamesState();
}

class _CostomGamesState extends State<CostomGames> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
              child: Orderdetalispag(
                nameProdact: widget.games.namePrdact,
                price: widget.games.price,
                photoProdact: widget.games.photoProdact,
                balance: widget.games.price,
                discrbion: widget.games.discrbion,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
      
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(widget.games.photoProdact),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
      
                Positioned(
                  top: 4,
                  right: 5,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.04,
                    backgroundColor: Colors.white,
                    child: InkWell(
                      onTap: widget.onTa7p,
                      child: Container(
                        child: widget.games.isFav
                            ? Icon(Icons.favorite, size: 19, color: Colors.red)
                            : Icon(Icons.favorite_border, size: 19, color: Colors.red),
                      ),
                    ),
                  ),
                ),
      
                Positioned(
                  bottom: 13,
                  right: 10,
                  child: Text(
                    widget.games.namePrdact,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
      
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "${widget.games.price}\$",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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