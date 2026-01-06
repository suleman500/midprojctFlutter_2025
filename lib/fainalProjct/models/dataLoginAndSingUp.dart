import 'package:flutter/material.dart';

class Dataloginandsingup {
  String ferstName;
  String lastName;
  String emmail;
  String password;

  Dataloginandsingup({
    required this.ferstName,
    required this.lastName,
    required this.emmail,
    required this.password,
  });

  Dataloginandsingup copywith({
    String? ferstName,
    String? lastName,
    String? emmail,
    String? password,
  }) {
    return Dataloginandsingup(
      ferstName: ferstName ?? this.ferstName,
      lastName: lastName ?? this.lastName,
      emmail: emmail ?? this.emmail,
      password: password ?? this.password,
    );
  }
}

List<Dataloginandsingup> listLogin = [
  Dataloginandsingup(
    ferstName: "Ali",
    lastName: "Ahmad",
    emmail: "AliAmad@gmail.com",
    password: "1515",
  ),
];
