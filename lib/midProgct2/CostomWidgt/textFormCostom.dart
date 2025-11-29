import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Stayle/styleDcrion.dart';

class TextformCostom extends StatelessWidget {
  IconData label;
  String helper;
  String ?hint;
 // Widget controllerr;


  bool obscuerr;
  Widget ?io;
  
  //String? Function(String?)? validator;
  void Function(String?)? onSaved;
  TextformCostom({required this.label,required this.helper,this.obscuerr=false,this.onSaved,this.hint,this.io });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

       Container(
        //decoration: StyleDcrion.stylDorion ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),label: Icon(label),
              helper: Text(helper),

              hintText: hint,
                hintStyle: TextStyle(fontFamily: "rrt1",fontSize: 12),
              //counter:controllerr,

suffixIcon:io,

            ),

            obscureText: obscuerr,

          validator: (value) {

            if(value!.isEmpty){
              return "IS Empty";
            }

            else if(value!.length<5){
              return "pless Enter 5 Charctr";

            }

            return null;

          },



            onSaved: onSaved,


          ),
        ),

    );
  }

    }