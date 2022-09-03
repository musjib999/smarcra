// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ExpenseModel {
  ExpenseModel({
    required this.id,
    required this.resourceFirstName,
    required this.resourceLastName,
    required this.nbExpense,
    required this.totalAmount,
    required this.status,
    required this.year,
    required this.month,
    required this.totalValided,
  });

  final int id;
  final String resourceFirstName;
  final String resourceLastName;
  final int nbExpense;
  final double totalAmount;
  final String status;
  final int year;
  final int month;
  final dynamic totalValided;

  factory ExpenseModel.fromRawJson(String str) => ExpenseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
    id: json["id"],
    resourceFirstName: json["resourceFirstName"],
    resourceLastName: json["resourceLastName"],
    nbExpense: json["nbExpense"],
    totalAmount: json["totalAmount"].toDouble(),
    status: json["status"],
    year: json["year"],
    month: json["month"],
    totalValided: json["totalValided"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "resourceFirstName": resourceFirstName,
    "resourceLastName": resourceLastName,
    "nbExpense": nbExpense,
    "totalAmount": totalAmount,
    "status": status,
    "year": year,
    "month": month,
    "totalValided": totalValided,
  };
}
