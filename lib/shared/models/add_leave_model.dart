import 'dart:convert';

class AddedLeaveModel {
  AddedLeaveModel({
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
  final int total;
  final dynamic typeCode;
  final dynamic managerFirstName;
  final dynamic managerLastName;
  final dynamic resourceId;

  factory AddedLeaveModel.fromRawJson(String str) => AddedLeaveModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddedLeaveModel.fromJson(Map<String, dynamic> json) => AddedLeaveModel(
    leaveId: json["leaveId"],
    resourceFirstName: json["resourceFirstName"],
    resourceLastName: json["resourceLastName"],
    year: json["year"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    statusCode: json["statusCode"],
    total: json["total"],
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
