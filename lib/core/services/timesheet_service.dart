import 'package:flutter/material.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/data/api_data.dart';
import 'package:smarcra/shared/global/configs.dart';
import 'package:smarcra/shared/models/timesheet_model.dart';

import '../../shared/global/global_var.dart';
import '../../shared/models/edit_data_timesheet_model.dart';

class TimeSheetService {
  Future<List<TimeSheetModel>> getTimeSheets(BuildContext context) async {
    List<TimeSheetModel> timeSheets = [];
    final response = await apiData.getRequest(
      '$appUrl/timesheet/resource/${currentUser.resourceId}',
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ${token.accessToken}'
      },
    );
    response.fold(
      (success) {
        if (success!.code == 200) {
          for (var timeSheet in success.data) {
            timeSheets.add(TimeSheetModel.fromJson(timeSheet));
          }
        } else {
          si.dialogService
              .successSnackBar(context, success.data['message'], true);
          timeSheets = [];
        }
      },
      (error) {
        si.dialogService.successSnackBar(context, error.error, true);
        timeSheets = [];
      },
    );

    return timeSheets;
  }

  Future<EditTimeSheetModel?> getEditTimeSheets(BuildContext context, {required int timeSheetId}) async {
    EditTimeSheetModel? editTimeSheet;
    final response = await apiData.getRequest(
      '$appUrl/timesheet/edit-data/$timeSheetId',
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ${token.accessToken}'
      },
    );
    response.fold(
      (success) {
        if (success!.code == 200) {
          final data = success.data;
          List<Line> line = [];
          data['lines'].forEach((x) {
            line.add(Line.fromJson(x));
          });
          editTimeSheet = EditTimeSheetModel(
            timesheetId: data['timesheetId'],
            year: data['year'],
            resourceId: data['resourceId'],
            resourceFirstName: data['resourceFirstName'],
            resourceLastName: data['resourceLastName'],
            missionId: data['missionId'],
            missionName: data['missionName'],
            month: data['month'],
            monthLabel: data['monthLabel'],
            clientId: data['clientId'],
            clientName: data['clientName'],
            contactId: data['contactId'],
            contactFirstName: data['contactFirstName'],
            contactLastName: data['contactLastName'],
            lines: line,
          );
        } else {
          si.dialogService
              .successSnackBar(context, success.data['message'], true);
          editTimeSheet = null;
        }
      },
      (error) {
        si.dialogService.successSnackBar(context, error.error, true);
        editTimeSheet = null;
      },
    );

    return editTimeSheet;
  }

  Future<bool> validateTimeSheet(BuildContext context, {required List<TimeSheetModel> timeSheets}) async {
    bool hasValidated = false;
    for (var timeSheet in timeSheets){
      final response = await apiData.getRequest(
        '$appUrl/timesheet/${timeSheet.timesheetId}/${currentUser.resourceId}/validate-employee',
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'Bearer ${token.accessToken}'
        },
      );
      response.fold(
            (success) {
              if(success == null){
                si.dialogService
                    .successSnackBar(context, 'Couldn\'t validated', true);
                hasValidated = true;
              }else{
                si.dialogService
                    .successSnackBar(context, '${success.data['response']} has been validated', false);
                hasValidated = true;
              }
        },
            (error) {
          si.dialogService.successSnackBar(context, error.error, true);
          hasValidated = false;
        },
      );
    }

    return hasValidated;
  }
}
