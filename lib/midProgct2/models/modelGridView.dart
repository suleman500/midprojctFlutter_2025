import 'package:flutter/material.dart';

class ModelGridview {
  String namePrdact;
  String spuNames;
  String PhotoProdact;
  IconData iconProdact = Icons.star_border_purple500_rounded;
  double price;

  ModelGridview({
    required this.namePrdact,
    required this.spuNames,
    required this.PhotoProdact,
    required this.iconProdact,
    this.price = 0
  });
}

List<ModelGridview> gameStoreProducts = [
  ModelGridview(
    namePrdact: "PlayStation 5",
    spuNames: "Gaming Consoles",
    PhotoProdact: "images/Ps5.jpg",
    iconProdact: Icons.videogame_asset,
    price: 499.99,
  ),
  ModelGridview(
    namePrdact: "Xbox Series X",
    spuNames: "Gaming Consoles",
    PhotoProdact: "images/Xboxseris.jpg",
    iconProdact: Icons.sports_esports,
    price: 499.99,
  ),
  ModelGridview(
    namePrdact: "Nintendo Switch",
    spuNames: "Portable Gaming",
    PhotoProdact: "images/HandGamis.jpg",
    iconProdact: Icons.gamepad,
    price: 299.99,
  ),
  ModelGridview(
    namePrdact: "Gaming Headset",
    spuNames: "Gaming Accessories",
    PhotoProdact: "images/maicro.jpg",
    iconProdact: Icons.headset,
    price: 79.99,
  ),
  ModelGridview(
    namePrdact: "Mechanical Keyboard",
    spuNames: "Gaming Accessories",
    PhotoProdact: "images/kybord.jpg",
    iconProdact: Icons.keyboard,
    price: 129.99,
  ),
  ModelGridview(
    namePrdact: "Gaming Mouse",
    spuNames: "Gaming Accessories",
    PhotoProdact: "images/maus.jpg",
    iconProdact: Icons.mouse,
    price: 59.99,
  ),
  ModelGridview(
    namePrdact: "Gaming Chair",
    spuNames: "Gaming Furniture",
    PhotoProdact: "images/chos.jpg",
    iconProdact: Icons.chair,
    price: 249.99,
  ),
  ModelGridview(
    namePrdact: "144Hz Gaming Monitor",
    spuNames: "Gaming Monitors",
    PhotoProdact: "images/144z.jpg",
    iconProdact: Icons.monitor,
    price: 299.99,
  ),
  ModelGridview(
    namePrdact: "Gift Cards",
    spuNames: "Gift Cards",
    PhotoProdact: "images/Control.jpg",
    iconProdact: Icons.card_giftcard,
    price: 50.00,
  ),
  ModelGridview(
    namePrdact: "Wireless Controller",
    spuNames: "Gaming Accessories",
    PhotoProdact: "images/pasCntrol.jpg",
    iconProdact: Icons.control_camera,
    price: 69.99,
  ),
  ModelGridview(
    namePrdact: "Webcam for Gaming",
    spuNames: "Streaming Accessories",
    PhotoProdact: "images/Camera.jpg",
    iconProdact: Icons.videocam,
    price: 89.99,
  ),
  ModelGridview(
    namePrdact: "Gaming Microphone",
    spuNames: "Streaming Accessories",
    PhotoProdact: "images/MicrofoSmu.jpg",
    iconProdact: Icons.mic,
    price: 99.99,
  ),
  ModelGridview(
    namePrdact: "PlayStation 4",
    spuNames: "Gaming Consoles",
    PhotoProdact: "images/ps4.jpg",
    iconProdact: Icons.memory,
    price: 299.99,
  ),
  ModelGridview(
    namePrdact: "Gaming Speakers",
    spuNames: "Audio Accessories",
    PhotoProdact: "images/Speker.jpg",
    iconProdact: Icons.speaker,
    price: 149.99,
  ),
  ModelGridview(
    namePrdact: "Gaming Backpack",
    spuNames: "Accessories",
    PhotoProdact: "images/Bak.jpg",
    iconProdact: Icons.work,
    price: 49.99,
  ),
];