import 'package:flutter/material.dart';

class Costomelvetod extends StatefulWidget {
  VoidCallback o;
  String namme;
  Color ccolorr;
  Costomelvetod({required this.o, required this.namme, this.ccolorr=Colors.indigo});

  @override
  _CostomelvetodState createState() => _CostomelvetodState();
}

class _CostomelvetodState extends State<Costomelvetod> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.o,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.ccolorr,
        foregroundColor: Colors.black,
      ),
      child: Text(widget.namme),
    );
  }
}
