import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orojct/fainalProjct/models/modelShopOrder.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/scriens/firstPage.dart';
import 'package:orojct/fainalProjct/scriens/home_shop_game.dart';
import 'package:orojct/fainalProjct/scriens/shopping_cart.dart';
import 'package:orojct/fainalProjct/stayle/colorStayle.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';


class Payprodact extends StatefulWidget{

  String namePrdact;
  String photoProdact;

  Payprodact({required this.photoProdact,required this.namePrdact});

  @override
  State<Payprodact> createState() => _PayprodactState();
}

class _PayprodactState extends State<Payprodact> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController lcaion = TextEditingController();

  TextEditingController number = TextEditingController();

  TextEditingController email = TextEditingController();

  bool fullForme=false;
  IconData? icon;
  String help="";



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      SingleChildScrollView(



        child: Column(


          children: [



          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(

                key: _formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width*0.50,
                        height: MediaQuery.of(context).size.height*0.30,

                        child: Column(
                          children: [
                            Container(

                                child: Expanded(child: Image.asset(widget.photoProdact,fit: BoxFit.scaleDown,))),
                            Text(widget.namePrdact,style:Textstayle.textStyle ,),
                          ],
                        )),
                  ),



                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Locaion :",style: Textstayle.textStyle,),
                        Container(
                            width: MediaQuery.of(context).size.width*0.50,
                            child: CustomTextField(label: Icons.dataset, hint:"Jarash-Sakep",control:lcaion ,helper: help,)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Namber :",style: Textstayle.textStyle,),
                        Container(
                            width: MediaQuery.of(context).size.width*0.50,
                            child: CustomTextField(label: Icons.dataset, hint:"+962779...",keyboardType: TextInputType.numberWithOptions(),control: number,helper:help,)),
                      ],
                    ),
                  ),


                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Email     :",style: Textstayle.textStyle,),
                        Container(
                            width: MediaQuery.of(context).size.width*0.50,
                            child: CustomTextField(label: Icons.dataset, hint:"Ajhggh@hotmail.com",control: email,suffix:Icon(icon),helper:help)),
                      ],
                    ),
                  ),


                ],)),

            InkWell(
              onTap: () {

                checkInputForm();

                fullForme?  EasyLoading.showSuccess('Great Success!'):Text("");

                fullForme?  Future.delayed(Duration(seconds: 2)).then((_) {
                  EasyLoading.dismiss();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      orderList.add(Modelshoporder(namePrdact: widget.namePrdact, photoProdact: widget.photoProdact, locion:lcaion .text , email: email.text, name:number.text ));
                      return Firstpage();
                    },),
                        (route) => false,
                  );
                }):Text("data");


              },
              child: Container(

                  child: Column(
                    children: [
                      LottieBuilder.network("https://lottie.host/a8b2d38f-a7c3-49dc-8529-cba360150976/OXf9ivgVQS.json",repeat: true,width: MediaQuery.of(context).size.width*0.25,),
                      Text("Buying",style: Textstayle.textStyle,),

                    ],
                  )),
            ),


            Container(

              child: Row(children: [

                Column(
                  children: [
                    Icon(Icons.credit_card),
                    Text("Cedit"),
                    Radio(value: "b", groupValue: "YAS", onChanged: (value) {}),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.phone_android),
                    Text("E-Wallet"),

                    Radio(value: "b", groupValue: "YAS", onChanged: (value) {}),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_shipping),
                    Text("Cash"),

                    Radio(value: "b", groupValue: "YAS", onChanged: (value) {}),
                  ],
                ),
              ],),
            ),

          ],),





          ]
      ),


      )
    );
  }

checkInputForm(){
if(_formKey.currentState!.validate()){
if(email.text.isNotEmpty&&lcaion.text.isNotEmpty&&number.text.isNotEmpty){


setState(() {
  fullForme=true;
  help="Good";
});
}
else{
  setState(() {
    icon= Icons.close;
  return print("Plese Enter The Forme");
  });


}

}

}
}