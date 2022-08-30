import 'package:flutter/material.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/data/api_data.dart';
import 'package:smarcra/shared/global/configs.dart';
import 'package:smarcra/shared/models/timesheet_model.dart';

import '../../shared/global/global_var.dart';

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
        if(success!.code == 200){
          for(var timeSheet in success.data){
            timeSheets.add(TimeSheetModel.fromJson(timeSheet));
          }
        }else{
          si.dialogService.successSnackBar(context, success.data['message'], true);
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
}
