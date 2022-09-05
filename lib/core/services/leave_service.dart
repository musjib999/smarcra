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

  Future addLeave(BuildContext context, {required String title, required DateTime startDate, required DateTime stopDate}) async {
    List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
      List<DateTime> days = [];
      for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        days.add(startDate.add(Duration(days: i)));
      }
      return days;
    }
   final response =  await apiData.postRequest(
      '$appUrl/leave/resource/${currentUser.resourceId}',
      context: context,
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ${token.accessToken}'
      },
    );
   response.fold((success){

   }, (error) {

   },
   );
  }
}
