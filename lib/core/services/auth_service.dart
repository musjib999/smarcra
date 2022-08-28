import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:smarcra/core/errors/request_error.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/data/api_data.dart';
import 'package:smarcra/shared/global/configs.dart';
import 'package:smarcra/shared/models/token_model.dart';
import 'package:smarcra/shared/models/user_model.dart';

class AuthService {
  Future<TokenModel?> requestForToken(BuildContext context) async {
    TokenModel? token;
    String username = 'smartcra-dev';
    String password = 'smartcra-dev123@!';
    final response = await apiData.postRequest(
      '$authUrl/oauth/token',
      context: context,
      body: {
        'username': 'olil.personne@gmail.com',
        'password': 'tesT123@!',
        'grant_type': 'password',
      },
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'authorization':
            'Basic ${base64.encode(utf8.encode('$username:$password'))}'
      },
      encoding: Encoding.getByName('utf-8'),
    );
    response.fold(
      (success) {
        if (success!.code == 200) {
          token = TokenModel.fromJson(success.data);
        } else {
          token = TokenModel(
            accessToken: '',
            tokenType: '',
            refreshToken: '',
            expiresIn: 0,
            scope: '',
            jti: '',
          );
        }
      },
      (error) {
        token = TokenModel(
          accessToken: '',
          tokenType: '',
          refreshToken: '',
          expiresIn: 0,
          scope: '',
          jti: '',
        );
      },
    );
    return token;
  }

  Future<Either<UserModel?, RequestError>> getUser(
      {required String token}) async {
    UserModel? user;
    final response = await apiData.getRequest(
      '$appUrl/user',
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      },
    );
    response.fold(
      (success) {
        if (success!.code == 200) {
          Left(user = UserModel.fromJson(success.data));
        } else {
          Left(
            user = UserModel(
              resourceId: 0,
              firstName: '',
              lastName: '',
              email: '',
              roleId: 0,
              roleName: '',
              permissionList: [],
              token: token,
              dateFormat: '',
              timesheetUnit: '',
              organization: '',
              leaveUnit: '',
              roleCode: '',
            ),
          );
        }
      },
      (error) {
        return Right(error.error);
      },
    );
    return Left(user);
  }

  Future<bool> login(BuildContext context) async {
    bool isLoginSuccessful = false;
    final token = await requestForToken(context);
    if (token!.accessToken != '' &&
        token.expiresIn != 0 &&
        token.refreshToken != '') {
      final response = await getUser(token: token.accessToken);
      response.fold(
        (user) {
          if(user!.firstName == '' && user.email == '' && user.resourceId == 0){
            isLoginSuccessful = false;
          }else{
            isLoginSuccessful = true;
          }
        },
        (error) {
          si.dialogService.successSnackBar(context, error.error, true);
        },
      );
    } else {
      isLoginSuccessful = false;
    }
    return isLoginSuccessful;
  }
}
