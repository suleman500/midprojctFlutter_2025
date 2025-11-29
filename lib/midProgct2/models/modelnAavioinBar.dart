import 'package:flutter/material.dart';
import 'package:orojct/midProgct2/home_Scrin.dart';

class ModelNaavioinbar {
  IconData  icons;
  String label;
  Widget page;
  ModelNaavioinbar({required this.icons,required this.label,required this.page});



}

List<ModelNaavioinbar> botinNavionBar = [
  ModelNaavioinbar(icons: Icons.home, label: "Home",page: HomeScrin()),
  ModelNaavioinbar(icons: Icons.person, label: "Profile",page:HomeScrin() ),
  ModelNaavioinbar(icons: Icons.shopping_cart, label: "Orders",page:HomeScrin() ),
];