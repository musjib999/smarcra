import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/data/api_data.dart';
import 'package:smarcra/data/local_data.dart';
import 'package:smarcra/shared/global/configs.dart';
import 'package:smarcra/shared/global/global_var.dart';
import 'package:smarcra/shared/models/token_model.dart';
import 'package:smarcra/shared/models/user_model.dart';

class AuthService {
  Future<TokenModel?> requestForToken(BuildContext context,
      {required String username, required String password}) async {
    TokenModel? token;
    String apiUsername = 'smartcra-dev';
    String apiPassword = 'smartcra-dev123@!';
    final response = await apiData.postRequest(
      '$authUrl/oauth/token',
      context: context,
      body: {
        'username': username,
        'password': password,
        'grant_type': 'password',
      },
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'authorization':
            'Basic ${base64.encode(utf8.encode('$apiUsername:$apiPassword'))}'
      },
      encoding: Encoding.getByName('utf-8'),
    );
    response.fold(
      (success) {
        if (success!.code == 200) {
          token = TokenModel.fromJson(success.data);
        } else {
          si.dialogService.successSnackBar(
              context, success.data['error_description'], true);
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
        si.dialogService.successSnackBar(context, error.error, true);
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

  Future<UserModel?> getUser({required String token}) async {
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
          user = UserModel.fromJson(success.data);
        } else {
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
          );
        }
      },
      (error) {
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
        );
      },
    );
    return user;
  }

  Future<bool> login(BuildContext context,
      {required String username, required String password}) async {
    bool isLoginSuccessful = false;
    final requestedToken =
        await requestForToken(context, username: username, password: password);
    if (requestedToken!.accessToken != '' &&
        requestedToken.expiresIn != 0 &&
        requestedToken.refreshToken != '') {
      if(rememberMe == true){
        await localData.addStringToSP(
            key: 'token', value: requestedToken.toRawJson(),
        );
      }
      token = requestedToken;
      final user = await getUser(token: requestedToken.accessToken);

      if (user!.firstName == '' && user.email == '' && user.resourceId == 0) {
        isLoginSuccessful = false;
      } else {
        if(rememberMe == true){
          await localData.addStringToSP(
            key: 'user', value: user.toRawJson(),
          );
        }
        currentUser = user;
        isLoginSuccessful = true;
        // print(isLoginSuccessful);
      }
    } else {
      isLoginSuccessful = false;
    }
    return isLoginSuccessful;
  }
}
