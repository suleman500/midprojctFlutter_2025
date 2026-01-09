import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/orderDetalisPag.dart';

class CostomProdact extends StatelessWidget {
  ModelProduct moGrd;
  bool? isFav=false;
  VoidCallback? onTa7p;
  double? balance;
  CostomProdact({required this.moGrd,this.isFav,this.onTa7p, this.balance});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onTa7p,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Orderdetalispag(
              nameProdact: moGrd.namePrdact,
              photoProdact: moGrd.photoProdact,
              price: moGrd.price,
              discrbion: moGrd.discrbion,
balance:balance ,
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
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Align(
                    child: moGrd.isFav ? Icon(Icons.favorite, size: 26, color: Colors.red): Icon(Icons.favorite_border, size: 26),
                    alignment: AlignmentGeometry.topRight),
              ),
            ),

            Expanded(
              flex: 3,
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(moGrd.photoProdact),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      moGrd.namePrdact,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "rrt1",

                      ),

                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
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
                          "\$${moGrd.price}",
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
            ),
          ],
        ),
      ),
    );
  }
}