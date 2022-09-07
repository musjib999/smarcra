import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smarcra/shared/models/leave_model.dart';

import '../../data/api_data.dart';
import '../../shared/global/configs.dart';
import '../../shared/global/global_var.dart';
import '../service_injector.dart';

class LeaveService {
  Future<List<LeaveModel>> getLeaves(BuildContext context) async {
    List<LeaveModel> leaves = [];
    final response = await apiData.getRequest(
      '$appUrl/leave/resource/${currentUser.resourceId}',
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ${token.accessToken}'
      },
    );
    response.fold((success) {
      if (success!.code == 200) {
        for (var leave in success.data) {
          leaves.add(LeaveModel.fromJson(leave));
        }
      } else {
        si.dialogService
            .successSnackBar(context, success.data['message'], true);
        leaves = [];
      }
    }, (error) {
      si.dialogService.successSnackBar(context, error.error, true);
      leaves = [];
    });
    return leaves;
  }

  Future<AddedLeaveModel?> addLeave(BuildContext context,
      {required String title,
      required DateTime startDate,
      required DateTime stopDate}) async {
    AddedLeaveModel? leave;
    List<DayListModel> dayList = [];
    for (int i = 0; i <= stopDate.difference(startDate).inDays; i++) {
      dayList.add(
        DayListModel(
          date: startDate.add(Duration(days: i)),
          morningValue: 4,
          afternoonValue: 4,
          isMorningValue: true,
          isAfternoonValue: true,
        ),
      );
    }
    final response = await apiData.postRequest(
      '$appUrl/leave/resource/${currentUser.resourceId}',
      context: context,
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ${token.accessToken}'
      },
      body: jsonEncode(
        {
          "id": null,
          "resourceId": currentUser.resourceId,
          "year": startDate.year,
          "title": title,
          "startDate": "${startDate.year}-${startDate.month}-${startDate.day}",
          "statusId": 1,
          "endDate": "${stopDate.year}-${stopDate.month}-${stopDate.day}",
          "typeId": 1,
          "dayList": dayList.map((e) => e.toJson()).toList(),
        },
      ),
    );
    response.fold(
      (success) {
        if (success!.code == 201) {
          leave = AddedLeaveModel.fromJson(success.data);
          si.dialogService.successSnackBar(context, 'Leave has been added successfully', false);
        } else {
          si.dialogService.successSnackBar(context, success.data['message'], true);
          leave = AddedLeaveModel(
            leaveId: 0,
            resourceFirstName: '',
            resourceLastName: '',
            year: 0000,
            startDate: DateTime.now(),
            endDate: DateTime.now(),
            statusCode: '',
            total: 0,
            typeCode: null,
            managerFirstName: null,
            managerLastName: null,
            resourceId: 0,
          );
        }
      },
      (error) {
        si.dialogService.successSnackBar(context, error.error, true);
        leave = AddedLeaveModel(
          leaveId: 0,
          resourceFirstName: '',
          resourceLastName: '',
          year: 0000,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          statusCode: '',
          total: 0,
          typeCode: null,
          managerFirstName: null,
          managerLastName: null,
          resourceId: 0,
        );
      },
    );
    return leave;
  }
}
