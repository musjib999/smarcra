
import 'dart:convert';

import 'package:flutter/material.dart';




class TimeSheetModel {
  TimeSheetModel({
    required this.timesheetId,
    required this.resourceId,
    required this.firstName,
    required this.lastName,
    required this.month,
    required this.year,
    required this.monthLabel,
    required this.totalPresence,
    required this.totalExtraHours,
    required this.totalExtraHourNight,
    required this.totalNightShift,
    required this.statusId,
    required this.statusCode,
    required this.totalWorked,
    required this.totalLeave,
    required this.totalSickness,
    required this.missionName,
    required this.missionId,
    required this.accountName,
    required this.accountId,
  });

  final int timesheetId;
  final dynamic resourceId;
  final String firstName;
  final String lastName;
  final int month;
  final int year;
  final String monthLabel;
  final double totalPresence;
  final double totalExtraHours;
  final double totalExtraHourNight;
  final double totalNightShift;
  final dynamic statusId;
  final String statusCode;
  final double totalWorked;
  final int totalLeave;
  final int totalSickness;
  final String missionName;
  final dynamic missionId;
  final String accountName;
  final dynamic accountId;

  factory TimeSheetModel.fromRawJson(String str) => TimeSheetModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeSheetModel.fromJson(Map<String, dynamic> json) => TimeSheetModel(
    timesheetId: json["timesheetId"],
    resourceId: json["resourceId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    month: json["month"],
    year: json["year"],
    monthLabel: json["monthLabel"],
    totalPresence: json["totalPresence"].toDouble(),
    totalExtraHours: json["totalExtraHours"].toDouble(),
    totalExtraHourNight: json["totalExtraHourNight"].toDouble(),
    totalNightShift: json["totalNightShift"].toDouble(),
    statusId: json["statusId"],
    statusCode: json["statusCode"],
    totalWorked: json["totalWorked"].toDouble(),
    totalLeave: json["totalLeave"],
    totalSickness: json["totalSickness"],
    missionName: json["missionName"],
    missionId: json["missionId"],
    accountName: json["accountName"],
    accountId: json["accountId"],
  );

  Map<String, dynamic> toJson() => {
    "timesheetId": timesheetId,
    "resourceId": resourceId,
    "firstName": firstName,
    "lastName": lastName,
    "month": month,
    "year": year,
    "monthLabel": monthLabel,
    "totalPresence": totalPresence,
    "totalExtraHours": totalExtraHours,
    "totalExtraHourNight": totalExtraHourNight,
    "totalNightShift": totalNightShift,
    "statusId": statusId,
    "statusCode": statusCode,
    "totalWorked": totalWorked,
    "totalLeave": totalLeave,
    "totalSickness": totalSickness,
    "missionName": missionName,
    "missionId": missionId,
    "accountName": accountName,
    "accountId": accountId,
  };
}

