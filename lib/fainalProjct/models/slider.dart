import 'package:flutter/material.dart';

class ModelSlider {
final String? id;
final String namePhtoos;

ModelSlider({
   this.id,
  required this.namePhtoos,
});

ModelSlider copyWith({
  String? id,
  String? namePhtoos,
}) {
  return ModelSlider(
    id: id ?? this.id,
    namePhtoos: namePhtoos ?? this.namePhtoos,
  );
}

Map<String, dynamic> toMap() {
  return {'namePhtoos': namePhtoos};
}

factory ModelSlider.fromMap(Map<String, dynamic> map, String docId) {
return ModelSlider(
id: docId,
namePhtoos: map['namePhtoos']??'',
);
}
}

/*List<ModelSlider> phtosAdss = [
  ModelSlider(namePhtoos: "images/GamV1.jpg"),
  ModelSlider(namePhtoos: "images/GamV2.jpeg"),
  ModelSlider(namePhtoos: "images/GamV3.jpg"),
  ModelSlider(namePhtoos: "images/GamV4.jpg"),
  ModelSlider(namePhtoos: "images/San.jpeg"),
];
List<ModelSlider> slid=[
  
  
  ModelSlider(namePhtoos:"images/sled1.jpeg" ),
  ModelSlider(namePhtoos:"images/slid2.jpeg" ),

];*/