import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/shared/models/api_response_model.dart';

import '../core/errors/request_error.dart';

class ApiData {
  Future<Either<ApiResponseModel?, RequestError>> postRequest(String url, {required BuildContext context, dynamic body, Map<String, String>? headers, Encoding? encoding}) async {
    ApiResponseModel apiResponseModel;
    try{
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
        encoding: encoding,
      );
      if (response.statusCode == 200) {
        Left(
            apiResponseModel = ApiResponseModel(code: response.statusCode, data: jsonDecode(response.body))
        );
      } else {
        Left(
        apiResponseModel = ApiResponseModel(code: response.statusCode, data: jsonDecode(response.body))
        );
      }
    }on SocketException catch(_){
      si.dialogService.successSnackBar(context, 'Please check your internet connection', true);
     return Right(
        RequestError(
            'Please check your internet connection'
        )
      );
    }
    return Left(apiResponseModel);
  }
  Future<Either<ApiResponseModel?, RequestError>> getRequest(String url, { Map<String, String>? headers}) async {
    ApiResponseModel? apiResponse;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        Left(
          apiResponse = ApiResponseModel(
            code: response.statusCode,
            data: jsonDecode(response.body),
          ),
        );
      } else {
        Left(
          apiResponse = ApiResponseModel(
            code: response.statusCode,
            data: jsonDecode(response.body),
          ),
        );
      }
    } on SocketException catch (_) {
      return Right(
          RequestError(
              'Please check your internet connection'
          )
      );
    }
    return Left(apiResponse);
  }
}

ApiData apiData = ApiData();
