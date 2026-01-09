import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/modelShopOrder.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costom_prodact.dart';
import 'package:orojct/orderDetalisPag.dart';


class OrderItem extends StatelessWidget {
  Modelshoporder order;
  VoidCallback onTap;

  OrderItem({required this.order,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Image.asset(
              order.photoProdact,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          SizedBox(height: 8),

          Container(
            width: MediaQuery.of(context).size.width ,
            height:MediaQuery.of(context).size.height *0.15,
            child: Column(children: [
              Text("NameProdact :${order.namePrdact}",style:Textstayle.textStyle3 ,),
              Text('Locaion :${order.locion}',style:Textstayle.textStyle3),
              Text('USER NAME :${order.name}',style:Textstayle.textStyle3),
              Text('Email :${order.email}',style:Textstayle.textStyle3),

            ],),
          ),
    InkWell(
    onTap: onTap,
    child: Icon(Icons.delete_forever))
        ],
      ),
    );
  }
}