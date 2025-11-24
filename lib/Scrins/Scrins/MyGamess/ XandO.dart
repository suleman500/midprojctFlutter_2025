import 'package:flutter/material.dart';

import '../../../Stayle/spashColer.dart';


class  xando extends StatefulWidget {

  @override
  State<xando> createState() => _xandoState();
}

class _xandoState extends State<xando> {
  List<ModelXandO> butonStat = [
    ModelXandO(),

    ModelXandO(),
    ModelXandO(),
    ModelXandO(),
    ModelXandO(),

    ModelXandO(),
    ModelXandO(),
    ModelXandO(),
    ModelXandO()
  ];

  @override
  Widget build(BuildContext context) {
    String s = "";
    return Scaffold(
      appBar: AppBar(

      ),

      body: SafeArea(
        child: Stack(
        
        
          children: [
            
            
            
        
        Container(
          decoration: Splshcoler.colerSplash2,
        ),
        
            
            Positioned(
              top: 400,
              bottom: 60,
             // right: 0.0,
              left: 234,

              child: Container(
                  //width: 150,
                 // height: 100,
                  child: Image.asset("images/asd.png")),
              
            ),
            
            Positioned(
              top: 80,
              //bottom: 0,
              height: 390,
              left: 0,
              right: 0,

              child: Expanded(

                child: Container(


                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 9,

                    itemBuilder: (context, index) {
                      return gemss(context, index,);
                    },
                  ),
                ),
              ),
            ),
        
          ],
        
        ),
      ),

    );
  }

  Widget gemss(BuildContext context, int index,) {
    return Container(
      decoration: Splshcoler.colerSplash2,
      child: Container(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                //  عشان اطبع او ل قيمه بقارن و طبع يا  o يا x ومش رح يطبع اذا اكن واحد جواته قيمه
                if (butonStat[index].X == null &&
                    butonStat[index].O == null) {
                  butonStat[index] = ModelXandO(X: "X");


                }

                //  اذا فيه قيمه  اطبع وذا
                //
                else if (butonStat[index].X != null) {
                  butonStat[index] = ModelXandO(O: "O");

                }

                // هون  برجع افاضيه عشان ارجع اطبع x
                //  مطلعها لما يكون كلشي فاضي من الشرط الاول

                else {
                  butonStat[index] = ModelXandO();
                }
              });
            },
            child: Text(butonStat[index].X??butonStat[index].O??"ضغط")
        ),
      ),
    );
  }
}

class ModelXandO {
  String? O;
  String? X;
  ModelXandO({this.O, this.X});
}
