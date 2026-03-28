import 'package:flutter/material.dart';

class Dataloginandsingup {
  String ferstName;
  String lastName;
  String emmail;
  String password;
  double balance;
  final String? id;

  Dataloginandsingup({
    required this.ferstName,
    required this.lastName,
    required this.emmail,
    required this.password,
    required this.balance,
    this.id
  });

  Dataloginandsingup copywith({
    String? ferstName,
    String? lastName,
    String? emmail,
    String? password,
    double? balance,
     String? id,
  }) {
    return Dataloginandsingup(
      ferstName: ferstName ?? this.ferstName,
      lastName: lastName ?? this.lastName,
      emmail: emmail ?? this.emmail,
      password: password ?? this.password,
      balance: balance ?? this.balance,
      id: id ?? this.id,
    );
  }




  Map<String, dynamic> toMap() {
    return {
      'ferstName': ferstName,
      'lastName': lastName,
      'emmail': emmail,
      ' password': password,
      'balance': balance,

    };

  }



  factory Dataloginandsingup.fromMap(Map<String, dynamic> map, String docId) {
    return Dataloginandsingup(
      ferstName : map['ferstName'],
      lastName: map['lastName'],
      emmail: map['emmail'],
      password: map['password'],
      balance: map['balance'],
      id: docId,

    );
  }
}



List<Dataloginandsingup> listLogin = [
  Dataloginandsingup(
    ferstName: "Ali",
    lastName: "Ahmad",
    emmail: "AliAmad@gmail.com",
    password: "1515",
    balance: 1000.0,
  ),
];