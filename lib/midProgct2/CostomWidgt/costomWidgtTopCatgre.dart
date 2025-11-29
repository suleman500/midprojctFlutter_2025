import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/models/modelTopCategories.dart';

class TopCatgerListViwe extends  StatelessWidget{

  ModelTopcateGories gories;

  TopCatgerListViwe({required this.gories});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {

          //عشان احط الصفجة الكلاس
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue[100],
                child: Icon(gories.icoonn, size: 20, color: Colors.blue),
              ),
              SizedBox(height: 5),
              Text(
                gories.namesTopCate,
                style: TextStyle(fontSize: 12,fontFamily: "rrt1"),

              ),
            ],
          ),
        ),
      ),
    );
  }

}


