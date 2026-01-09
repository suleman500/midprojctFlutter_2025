import 'package:flutter/material.dart';

class Dataloginandsingup {
  String ferstName;
  String lastName;
  String emmail;
  String password;
  double balance;

  Dataloginandsingup({
    required this.ferstName,
    required this.lastName,
    required this.emmail,
    required this.password,
    required this.balance,
  });

  Dataloginandsingup copywith({
    String? ferstName,
    String? lastName,
    String? emmail,
    String? password,
    double? balance,
  }) {
    return Dataloginandsingup(
      ferstName: ferstName ?? this.ferstName,
      lastName: lastName ?? this.lastName,
      emmail: emmail ?? this.emmail,
      password: password ?? this.password,
      balance: balance ?? this.balance,
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