
import 'dart:convert';

class UserModel {
  UserModel({
    required this.resourceId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.roleId,
    required this.roleName,
    required this.permissionList,
    required this.token,
    required this.dateFormat,
    required this.timesheetUnit,
    required this.organization,
    required this.leaveUnit,
    required this.roleCode,
  });

  final int resourceId;
  final String firstName;
  final String lastName;
  final String email;
  final int roleId;
  final String roleName;
  final List<String> permissionList;
  final dynamic token;
  final String dateFormat;
  final String timesheetUnit;
  final dynamic organization;
  final String leaveUnit;
  final String roleCode;

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    resourceId: json["resourceId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    roleId: json["roleId"],
    roleName: json["roleName"],
    permissionList: List<String>.from(json["permissionList"].map((x) => x)),
    token: json["token"],
    dateFormat: json["dateFormat"],
    timesheetUnit: json["timesheetUnit"],
    organization: json["organization"],
    leaveUnit: json["leaveUnit"],
    roleCode: json["roleCode"],
  );

  Map<String, dynamic> toJson() => {
    "resourceId": resourceId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "roleId": roleId,
    "roleName": roleName,
    "permissionList": List<dynamic>.from(permissionList.map((x) => x)),
    "token": token,
    "dateFormat": dateFormat,
    "timesheetUnit": timesheetUnit,
    "organization": organization,
    "leaveUnit": leaveUnit,
    "roleCode": roleCode,
  };
}
