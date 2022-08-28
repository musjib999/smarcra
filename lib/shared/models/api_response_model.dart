import 'dart:convert';

class ApiResponseModel {
  ApiResponseModel({
    required this.code,
    required this.data,
  });

  final int code;
  final dynamic data;

  factory ApiResponseModel.fromRawJson(String str) => ApiResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
    code: json["code"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data,
  };
}