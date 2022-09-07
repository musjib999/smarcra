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


class DayListModel {
  DayListModel({
    required this.date,
    required this.morningValue,
    required this.afternoonValue,
    required this.isMorningValue,
    required this.isAfternoonValue,
  });

  final DateTime date;
  final int morningValue;
  final int afternoonValue;
  final bool isMorningValue;
  final bool isAfternoonValue;

  factory DayListModel.fromRawJson(String str) => DayListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DayListModel.fromJson(Map<String, dynamic> json) => DayListModel(
    date: DateTime.parse(json["date"]),
    morningValue: json["morningValue"],
    afternoonValue: json["afternoonValue"],
    isMorningValue: json["isMorningValue"],
    isAfternoonValue: json["isAfternoonValue"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "morningValue": morningValue,
    "afternoonValue": afternoonValue,
    "isMorningValue": isMorningValue,
    "isAfternoonValue": isAfternoonValue,
  };
}


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
