import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/widget/costom_prodact.dart';
class Pagesearsch extends StatelessWidget {
  List? prodact;
  Pagesearsch({this.prodact});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:  Container(


            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10,mainAxisSpacing: 10,crossAxisCount: 2),itemCount:prodact!.length  ,itemBuilder: (context, index) => Expanded(child: CostomProdact(moGrd:prodact![index],))
            )

        )





    );
  }


}