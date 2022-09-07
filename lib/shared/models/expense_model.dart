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

class AddedExpenseModel {
  AddedExpenseModel({
    required this.id,
    required this.resourceId,
    required this.resourceName,
    required this.year,
    required this.month,
    required this.missionId,
    required this.missionName,
    required this.expenseTypeCode,
    required this.expenseTypeLabel,
    required this.expenseStatusCode,
    required this.expenseDate,
    required this.countryCode,
    required this.amountWithVat,
    required this.vat,
    required this.vatAmount,
    required this.amountWithoutVat,
    required this.description,
    required this.fileName,
    required this.fileDownloadLink,
    required this.fileId,
  });

  final int id;
  final int resourceId;
  final String resourceName;
  final int year;
  final int month;
  final dynamic missionId;
  final dynamic missionName;
  final String expenseTypeCode;
  final dynamic expenseTypeLabel;
  final String expenseStatusCode;
  final DateTime expenseDate;
  final String countryCode;
  final dynamic amountWithVat;
  final dynamic vat;
  final dynamic vatAmount;
  final dynamic amountWithoutVat;
  final String description;
  final dynamic fileName;
  final dynamic fileDownloadLink;
  final dynamic fileId;

  factory AddedExpenseModel.fromRawJson(String str) => AddedExpenseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddedExpenseModel.fromJson(Map<String, dynamic> json) => AddedExpenseModel(
    id: json["id"],
    resourceId: json["resourceId"],
    resourceName: json["resourceName"],
    year: json["year"],
    month: json["month"],
    missionId: json["missionId"],
    missionName: json["missionName"],
    expenseTypeCode: json["expenseTypeCode"],
    expenseTypeLabel: json["expenseTypeLabel"],
    expenseStatusCode: json["expenseStatusCode"],
    expenseDate: DateTime.parse(json["expenseDate"]),
    countryCode: json["countryCode"],
    amountWithVat: json["amountWithVat"],
    vat: json["vat"],
    vatAmount: json["vatAmount"],
    amountWithoutVat: json["amountWithoutVat"],
    description: json["description"],
    fileName: json["fileName"],
    fileDownloadLink: json["fileDownloadLink"],
    fileId: json["fileId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "resourceId": resourceId,
    "resourceName": resourceName,
    "year": year,
    "month": month,
    "missionId": missionId,
    "missionName": missionName,
    "expenseTypeCode": expenseTypeCode,
    "expenseTypeLabel": expenseTypeLabel,
    "expenseStatusCode": expenseStatusCode,
    "expenseDate": "${expenseDate.year.toString().padLeft(4, '0')}-${expenseDate.month.toString().padLeft(2, '0')}-${expenseDate.day.toString().padLeft(2, '0')}",
    "countryCode": countryCode,
    "amountWithVat": amountWithVat,
    "vat": vat,
    "vatAmount": vatAmount,
    "amountWithoutVat": amountWithoutVat,
    "description": description,
    "fileName": fileName,
    "fileDownloadLink": fileDownloadLink,
    "fileId": fileId,
  };
}
