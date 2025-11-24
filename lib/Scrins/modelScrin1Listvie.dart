import 'package:flutter/material.dart';




class modeliteemlist{
  String name;
  IconData iconlist;
  modeliteemlist({required this.name,required this.iconlist});


}


List<modeliteemlist> itemlistt=[
  modeliteemlist(name: "  All     ", iconlist: Icons.all_inbox),
  modeliteemlist(name: "favorte",  iconlist:  Icons.favorite),


];
