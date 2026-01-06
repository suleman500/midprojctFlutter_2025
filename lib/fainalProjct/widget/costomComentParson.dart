import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/modelParson.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';
import 'package:orojct/midProgct2/Stayle/staylText.dart';


class Costomcomentparson extends StatelessWidget {
  CommentModel paerson;
  Costomcomentparson({required this.paerson});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(paerson.personName,style: Stayltext.textStyle.copyWith(fontSize: 12),),
            subtitle: Text(paerson.comment),
            trailing: Column(
              children: [
                Text("${paerson.rating} "),
                Icon(Icons.star,color: Colors.amber,size: 16,)
              ],
            ),



          ),
        ),
        Text("Date : ${paerson.date.toString()}",style: TextStyle(fontSize: 5),)
      ],
    );
  }


}