import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/Categories.dart';
import 'package:orojct/fainalProjct/scriens/payProdact.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomComentParson.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';

import 'fainalProjct/models/dataLoginAndSingUp.dart';
import 'fainalProjct/models/modelParson.dart';

import 'package:readmore/readmore.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'dart:math';


class Orderdetalispag extends StatefulWidget {
  String nameProdact;
  double price;
  String photoProdact;
  String? discrbion;

  double? balance;

  Orderdetalispag(
      {required this.nameProdact, required this.price, required this.photoProdact, this.discrbion, this.balance});

  @override
  State<Orderdetalispag> createState() => _OrderdetalispagState();
}

class _OrderdetalispagState extends State<Orderdetalispag> {
  TextEditingController comment = TextEditingController();
  bool showComent=false;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(11);

    return Scaffold(
    appBar: AppBar(),

    backgroundColor:Colors.white ,
    body: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(widget.photoProdact),

    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Card(child: Text(""),), Card(child: Text("0"),), Card(child: Text("0"),),

    ],),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("5/6",style: Textstayle.textStyle3.copyWith(fontSize: 13)),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text("JOR${widget.price.toString()}",style:Textstayle.textStyle3.copyWith(fontSize: 15) ,),
        
        Text("MY balance : ${widget.balance}")
      ],
    ),
    ),

    ],),

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Text("4.88",style:Textstayle.textStyle3.copyWith(fontSize: 14),),
    SizedBox(width: 2,),
    Icon(Icons.star,color: Colors.amber,size: 15,)
    ],),
    ),

    ListTile(


    title: ReadMoreText(
    "${widget.discrbion!}",
    trimLines: 2,
    colorClickableText: Colors.black,
    trimMode: TrimMode.Line,
    trimCollapsedText:"More" ,

    trimExpandedText:"...Less",
    lessStyle:Textstayle.textStyle3.copyWith(fontSize: 15) ,
    moreStyle:Textstayle.textStyle3.copyWith(fontSize: 15) ,

    ),
    //subtitle: Text(discrbion!),


    ),
    SizedBox(height: 40,),

      Align(
        alignment: AlignmentGeometry.topLeft,
        child: Container(
            width: MediaQuery.of(context).size.width*0.70,
            height: MediaQuery.of(context).size.height*0.12,
            child: Row(
              children: [
                Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: CircleAvatar(child: Icon(Icons.person),)),
                Expanded(child: CustomTextField(label: Icons.comment, hint: "Comeent",obscureText: false ,helper: "",control:comment ,onSaved: (u) {

                setState(() {
                  u=  comment.text;


                });
                },)),
InkWell(
onTap: () {
  if(comment!=null){
    setState(() {
      showComent=true;
    });
    

  }
 

}
,child: Card(margin: EdgeInsets.all(5),child: Text("اضافة تعليق"))),
              ],
            )),
      ),







      showComent?  Card(
        child: Padding(
          padding: const EdgeInsets.only(right: 15,left: 20),
          child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text("My",style:Textstayle.textStyle3.copyWith(fontSize: 12),),
              subtitle: Text(comment.text),
              trailing: Column(
                children: [
                  Text("${""} "),
                  Icon(Icons.star,color: Colors.amber,size: 16,)
                ],
              ),
          ),
        ),
      ):Text(""),





            Container(
    width: MediaQuery.of(context).size.width,


    height: MediaQuery.of(context).size.height*0.50,
    child: ListView.builder(itemCount:6 ,itemBuilder: (context, index) {
    return Costomcomentparson(paerson: commentList[randomNumber]);
    },),

    ),
    SizedBox(height: 50,),
    ],

    ),
    ),

    bottomSheet:InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Payprodact(photoProdact: widget.photoProdact, namePrdact:widget.nameProdact,),));
      },

      child: Card(
      color: Colors.blue,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
        height:MediaQuery.of(context).size.height*0.07 ,
        child: Column(children: [
        Icon(Icons.shopping_cart,size: 33,color: Colors.black38,),
        Text("شراء الان",)

        ],),),



      ],),
      ),
    ),


    );
  }
}