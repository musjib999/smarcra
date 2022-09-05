
import 'dart:convert';

class EditTimeSheetModel {
  EditTimeSheetModel({
    required this.timesheetId,
    required this.year,
    required this.resourceId,
    required this.resourceFirstName,
    required this.resourceLastName,
    required this.missionId,
    required this.missionName,
    required this.month,
    required this.monthLabel,
    required this.clientId,
    required this.clientName,
    required this.contactId,
    required this.contactFirstName,
    required this.contactLastName,
    required this.lines,
  });

  final int timesheetId;
  final int year;
  final int resourceId;
  final String resourceFirstName;
  final String resourceLastName;
  final int missionId;
  final String missionName;
  final int month;
  final String monthLabel;
  final int clientId;
  final String clientName;
  final int contactId;
  final String contactFirstName;
  final String contactLastName;
  final List<Line> lines;

  factory EditTimeSheetModel.fromRawJson(dynamic str) => EditTimeSheetModel.fromJson(json.decode(str));

  dynamic toRawJson() => json.encode(toJson());

  factory EditTimeSheetModel.fromJson(Map<dynamic, dynamic> json) => EditTimeSheetModel(
    timesheetId: json["timesheetId"],
    year: json["year"],
    resourceId: json["resourceId"],
    resourceFirstName: json["resourceFirstName"],
    resourceLastName: json["resourceLastName"],
    missionId: json["missionId"],
    missionName: json["missionName"],
    month: json["month"],
    monthLabel: json["monthLabel"],
    clientId: json["clientId"],
    clientName: json["clientName"],
    contactId: json["contactId"],
    contactFirstName: json["contactFirstName"],
    contactLastName: json["contactLastName"],
    lines: List<Line>.from(json["lines"].map((x) => Line.fromJson(x))),
  );

  Map<dynamic, dynamic> toJson() => {
    "timesheetId": timesheetId,
    "year": year,
    "resourceId": resourceId,
    "resourceFirstName": resourceFirstName,
    "resourceLastName": resourceLastName,
    "missionId": missionId,
    "missionName": missionName,
    "month": month,
    "monthLabel": monthLabel,
    "clientId": clientId,
    "clientName": clientName,
    "contactId": contactId,
    "contactFirstName": contactFirstName,
    "contactLastName": contactLastName,
    "lines": List<dynamic>.from(lines.map((x) => x.toJson())),
  };
}

class Line {
  Line({
    required this.id,
    required this.timeSheetId,
    required this.description,
    required this.day,
    required this.dayCode,
    required this.weekend,
    required this.holiday,
    required this.presence,
    required this.extraWorkDay,
    required this.extraWorkNight,
    required this.nightShift,
    required this.disabled,
    required this.leave,
    required this.presenseMaxValue,
    required this.extraWorkDayMaxValue,
    required this.extraWorkNightMaxValue,
    required this.nightShitMaxValue,
    required this.backgroundColor,
  });

  final int id;
  final int timeSheetId;
  final dynamic description;
  final int day;
  final String dayCode;
  final bool weekend;
  final bool holiday;
  final double presence;
  final dynamic extraWorkDay;
  final dynamic extraWorkNight;
  final dynamic nightShift;
  final bool disabled;
  final bool leave;
  final double presenseMaxValue;
  final double extraWorkDayMaxValue;
  final double extraWorkNightMaxValue;
  final double nightShitMaxValue;
  final dynamic backgroundColor;

  factory Line.fromRawJson(String str) => Line.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Line.fromJson(Map<String, dynamic> json) => Line(
    id: json["id"],
    timeSheetId: json["timeSheetId"],
    description: json["description"],
    day: json["day"],
    dayCode: json["dayCode"],
    weekend: json["weekend"],
    holiday: json["holiday"],
    presence: json["presence"].toDouble(),
    extraWorkDay: json["extraWorkDay"],
    extraWorkNight: json["extraWorkNight"],
    nightShift: json["nightShift"],
    disabled: json["disabled"],
    leave: json["leave"],
    presenseMaxValue: json["presenseMaxValue"].toDouble(),
    extraWorkDayMaxValue: json["extraWorkDayMaxValue"].toDouble(),
    extraWorkNightMaxValue: json["extraWorkNightMaxValue"].toDouble(),
    nightShitMaxValue: json["nightShitMaxValue"].toDouble(),
    backgroundColor: json["backgroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "timeSheetId": timeSheetId,
    "description": description,
    "day": day,
    "dayCode": dayCode,
    "weekend": weekend,
    "holiday": holiday,
    "presence": presence,
    "extraWorkDay": extraWorkDay,
    "extraWorkNight": extraWorkNight,
    "nightShift": nightShift,
    "disabled": disabled,
    "leave": leave,
    "presenseMaxValue": presenseMaxValue,
    "extraWorkDayMaxValue": extraWorkDayMaxValue,
    "extraWorkNightMaxValue": extraWorkNightMaxValue,
    "nightShitMaxValue": nightShitMaxValue,
    "backgroundColor": backgroundColor,
  };
}

// class Line {
//   Line({
//     required this.id,
//     required this.timeSheetId,
//     required this.description,
//     required this.day,
//     required this.dayCode,
//     required this.weekend,
//     required this.holiday,
//     required this.presence,
//     required this.leave,
//     required this.presenseMaxValue,
//     required this.backgroundColor,
//   });
//
//   final int id;
//   final int timeSheetId;
//   final dynamic description;
//   final int day;
//   final dynamic dayCode;
//   final bool weekend;
//   final bool holiday;
//   final dynamic presence;
//   final bool leave;
//   final dynamic presenseMaxValue;
//   final dynamic backgroundColor;
//
//   factory Line.fromRawJson(dynamic str) => Line.fromJson(json.decode(str));
//
//   dynamic toRawJson() => json.encode(toJson());
//
//   factory Line.fromJson(Map<dynamic, dynamic> json) => Line(
//     id: json["id"],
//     timeSheetId: json["timeSheetId"],
//     description: json["description"],
//     day: json["day"],
//     dayCode: json["dayCode"],
//     weekend: json["weekend"],
//     holiday: json["holiday"],
//     presence: json["presence"].toDouble(),
//     leave: json["leave"],
//     presenseMaxValue: json["presenseMaxValue"].toDouble(),
//     backgroundColor: json["backgroundColor"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "id": id,
//     "timeSheetId": timeSheetId,
//     "description": description,
//     "day": day,
//     "dayCode": dayCode,
//     "weekend": weekend,
//     "holiday": holiday,
//     "presence": presence,
//     "leave": leave,
//     "presenseMaxValue": presenseMaxValue,
//     "backgroundColor": backgroundColor,
//   };
// }

