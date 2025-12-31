import 'package:flutter/material.dart';

class ModelCgories {
  final String namesTopCate;
  final String lotiNames;
  final Widget ?pagess;

  ModelCgories({
    required this.namesTopCate,
    required this.lotiNames,
    this.pagess
  });

  ModelCgories copywith({
    String? namesTopCate,
    String? lotiNames ,
    Widget? pagess,
  }) {
    return ModelCgories(
        namesTopCate: namesTopCate ?? this.namesTopCate,
        lotiNames: lotiNames ?? this.lotiNames,
        pagess: pagess ?? this.pagess
    );
  }
}

List<ModelCgories> categoriesList = [
  ModelCgories(
      namesTopCate: 'All',
      lotiNames: "https://lottie.host/72848b6f-55d6-40d0-a2ae-b1ebe6be8c35/nftHNfdn6F.json"
  ),
  ModelCgories(
      namesTopCate: 'Electronics',
      lotiNames: "https://lottie.host/09da924b-7ba1-4ca1-8c61-b9d116a490b6/uNJ75BUR7P.json"
  ),
  ModelCgories(
      namesTopCate: 'Video Games',
      lotiNames: "https://lottie.host/3d984755-83d1-4016-b3a4-efbbaf129135/3qFk42gke2.json"
  ),
  ModelCgories(
      namesTopCate: 'Pre-Order',
      lotiNames: "https://lottie.host/80472bd8-985b-47a4-b399-2f7ddb3aa438/M5N72msXhR.json"
  ),
];