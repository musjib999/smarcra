import 'package:flutter/material.dart';
import 'package:smarcra/shared/models/expense_model.dart';

import '../../data/api_data.dart';
import '../../shared/global/configs.dart';
import '../../shared/global/global_var.dart';
import '../service_injector.dart';

class ExpenseService {
  Future<List<ExpenseModel>> getExpenses(BuildContext context) async {
    List<ExpenseModel> expenses = [];
    final response = await apiData.getRequest(
      '$appUrl/expense-summary/resource/${currentUser.resourceId}',
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ${token.accessToken}'
      },
    );
    response.fold((success) {
      if (success!.code == 200) {
        for (var expense in success.data) {
          expenses.add(ExpenseModel.fromJson(expense));
        }
      } else {
        si.dialogService
            .successSnackBar(context, success.data['message'], true);
        expenses = [];
      }
    }, (error) {
      si.dialogService.successSnackBar(context, error.error, true);
      expenses = [];
    });
    return expenses;
  }
}
