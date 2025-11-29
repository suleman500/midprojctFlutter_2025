import 'package:flutter/material.dart';

class ModelTopcateGories {
  String namesTopCate;
  IconData icoonn;
  Widget ?pagess;
  ModelTopcateGories({required this.namesTopCate,required this.icoonn , this.pagess});


}


List<ModelTopcateGories> topCategoriesList = [
  ModelTopcateGories(namesTopCate: 'PlayStation', icoonn: Icons.sports_esports),
  ModelTopcateGories(namesTopCate: 'Xbox', icoonn: Icons.videogame_asset),
  ModelTopcateGories(namesTopCate: 'Nintendo', icoonn: Icons.games),
  ModelTopcateGories(namesTopCate: 'PC Gaming', icoonn: Icons.computer),
  ModelTopcateGories(namesTopCate: 'Action Games', icoonn: Icons.bolt),
  ModelTopcateGories(namesTopCate: 'Sports Games', icoonn: Icons.sports_soccer),
  ModelTopcateGories(namesTopCate: 'Racing Games', icoonn: Icons.directions_car),
  ModelTopcateGories(namesTopCate: 'Adventure', icoonn: Icons.landscape),
  ModelTopcateGories(namesTopCate: 'Strategy', icoonn: Icons.psychology),
  ModelTopcateGories(namesTopCate: 'FPS', icoonn: Icons.center_focus_strong),
  ModelTopcateGories(namesTopCate: 'RPG', icoonn: Icons.auto_awesome),
  ModelTopcateGories(namesTopCate: 'Indie Games', icoonn: Icons.emoji_objects),
  ModelTopcateGories(namesTopCate: 'VR Games', icoonn: Icons.view_in_ar),
  ModelTopcateGories(namesTopCate: 'Mobile Games', icoonn: Icons.phone_iphone),
  ModelTopcateGories(namesTopCate: 'Accessories', icoonn: Icons.headset),
  ModelTopcateGories(namesTopCate: 'Consoles', icoonn: Icons.memory),
  ModelTopcateGories(namesTopCate: 'Controllers', icoonn: Icons.gamepad),
  ModelTopcateGories(namesTopCate: 'Gift Cards', icoonn: Icons.card_giftcard),
];