import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/orderDetalisPag.dart';
import 'package:page_transition/page_transition.dart';

class CostomProdact extends StatefulWidget {
  ModelProduct moGrd;
  bool isFav;
  VoidCallback? onTa7p;
  double? balance;

  CostomProdact({
    required this.moGrd,
    required this.isFav,
    this.onTa7p,
    this.balance,
  });

  @override
  State<CostomProdact> createState() => _CostomProdactState();
}

class _CostomProdactState extends State<CostomProdact> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(


      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            child: Orderdetalispag(
              nameProdact:widget.moGrd.namePrdact,
              price: widget.moGrd.price,
              photoProdact: widget.moGrd.photoProdact,
              balance: widget.moGrd.price,
              discrbion: widget.moGrd.discrbion,
            ),
          ),
        );
      },

      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              //  radius: MediaQuery.of(context).size.width * 0.04,
              backgroundColor: Colors.white,

              child: InkWell(
                onTap: widget.onTa7p,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Container(
                      child: widget.isFav
                          ? Icon(Icons.favorite, size: 19, color: Colors.red)
                          : Icon(
                              Icons.favorite_border,
                              size: 19,
                              color: Colors.red,
                            ),
                    ),

                    alignment: Alignment.topRight,
                  ),
                ),
              ),
            ),

            Flexible(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(widget.moGrd.photoProdact),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.moGrd.namePrdact,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "rrt1",
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "5.0",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$${widget.moGrd.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
