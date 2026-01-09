import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  IconData? label;
  String hint;
  Widget? suffix;
  String helper;
  bool? obscureText;
  TextInputType? keyboardType;
  void Function(String?)? onSaved;
  TextEditingController? control ;
  CustomTextField({
    required this.label,
    required this.hint,
    this.suffix,
    this.keyboardType,
    this.onSaved,
    this.control,
    required  this.helper,
    this.obscureText


  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Colors.white38,
      shadowColor: Colors.white,
      child: TextFormField(
      obscureText: obscureText!,

        keyboardType: keyboardType,
        decoration: InputDecoration(

          fillColor:   Colors.white54,
          border:InputBorder.none ,
          label:Icon(label) ,
          hintText: hint,
         // prefixIcon: Icon(label),
          suffixIcon: suffix,
          helper: Text(helper),

        ),
        controller:control ,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "nulll";
          }

        },

      ),
    );
  }

}