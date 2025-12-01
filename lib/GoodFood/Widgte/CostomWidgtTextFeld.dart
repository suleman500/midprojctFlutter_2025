import 'package:flutter/material.dart';


class Costomwidgttextfeld extends StatelessWidget {
  IconData label;
  IconData ?suffix;
  String hint;
  bool enabled;

  Costomwidgttextfeld({required this.label,
   this.suffix,
  required this.hint,
  required this.enabled});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(


        decoration: InputDecoration(label: Icon(label),
        suffixIcon: Icon(suffix),
          hint:Text(hint) ,
          enabled: enabled,
          border: OutlineInputBorder()



        ),
        validator: (value) {
          if(value!.isEmpty){
            return "Is Empty";

          }
          else if(value!.length<5){
      return "Lingth is less than 5 ";

          }
          return null;

        },

      ),
    );
  }




}