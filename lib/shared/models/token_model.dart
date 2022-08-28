import 'dart:convert';

class TokenModel {
  TokenModel({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.expiresIn,
    required this.scope,
    required this.jti,
  });

  final String accessToken;
  final String tokenType;
  final String refreshToken;
  final int expiresIn;
  final String scope;
  final String jti;

  factory TokenModel.fromRawJson(String str) => TokenModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    refreshToken: json["refresh_token"],
    expiresIn: json["expires_in"],
    scope: json["scope"],
    jti: json["jti"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "refresh_token": refreshToken,
    "expires_in": expiresIn,
    "scope": scope,
    "jti": jti,
  };
}