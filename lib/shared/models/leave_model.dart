import 'dart:convert';

class LeaveModel {
  LeaveModel({
    required this.leaveId,
    required this.resourceFirstName,
    required this.resourceLastName,
    required this.year,
    required this.startDate,
    required this.endDate,
    required this.statusCode,
    required this.total,
    required this.typeCode,
    required this.managerFirstName,
    required this.managerLastName,
    required this.resourceId,
  });

  final int leaveId;
  final String resourceFirstName;
  final String resourceLastName;
  final int year;
  final DateTime startDate;
  final DateTime endDate;
  final String statusCode;
  final double total;
  final String typeCode;
  final String? managerFirstName;
  final String? managerLastName;
  final int resourceId;

  factory LeaveModel.fromRawJson(String str) => LeaveModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
    leaveId: json["leaveId"],
    resourceFirstName: json["resourceFirstName"],
    resourceLastName: json["resourceLastName"],
    year: json["year"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    statusCode: json["statusCode"],
    total: json["total"].toDouble(),
    typeCode: json["typeCode"],
    managerFirstName: json["managerFirstName"],
    managerLastName: json["managerLastName"],
    resourceId: json["resourceId"],
  );

  Map<String, dynamic> toJson() => {
    "leaveId": leaveId,
    "resourceFirstName": resourceFirstName,
    "resourceLastName": resourceLastName,
    "year": year,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "statusCode": statusCode,
    "total": total,
    "typeCode": typeCode,
    "managerFirstName": managerFirstName,
    "managerLastName": managerLastName,
    "resourceId": resourceId,
  };
}
