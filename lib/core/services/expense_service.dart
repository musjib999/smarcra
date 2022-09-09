import 'dart:convert';

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

  Future<AddedExpenseModel?> addExpense(
      {required BuildContext context,
      required double amount,
      required DateTime date,
        required int type,
      required String file}) async {
    AddedExpenseModel? expense;
    final response = await apiData.postRequest(
      '$appUrl/expense/resource/${currentUser.resourceId}',
      context: context,
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ${token.accessToken}'
      },
      body: jsonEncode({
        'id': null,
        'amount': amount,
        'countryId': 630,
        'description': '',
        'expenseDate': '${date.year}-${date.month}-${date.day}',
        'expenseTypeId': type,
        'missionId': null,
        'month': date.month,
        'resourceId': currentUser.resourceId,
        'year': date.year,
        'file': file,
      }),
    );
    response.fold(
      (success) {
        if (success!.code == 201) {
          expense = AddedExpenseModel.fromJson(success.data);
        } else {
          si.dialogService
              .successSnackBar(context, success.data['message'].toString(), true);
          expense = AddedExpenseModel(
              id: 0,
              resourceId: 0,
              resourceName: '',
              year: 0000,
              month: 0,
              missionId: 0,
              missionName: null,
              expenseTypeCode: '',
              expenseTypeLabel: null,
              expenseStatusCode: '',
              expenseDate: DateTime.now(),
              countryCode: '',
              amountWithVat: null,
              vat: null,
              vatAmount: null,
              amountWithoutVat: null,
              description: '',
              fileName: '',
              fileDownloadLink: '',
              fileId: 0,
          );
        }
      },
      (error) {
        si.dialogService
            .successSnackBar(context, error.error, true);
        expense = AddedExpenseModel(
          id: 0,
          resourceId: 0,
          resourceName: '',
          year: 0000,
          month: 0,
          missionId: 0,
          missionName: null,
          expenseTypeCode: '',
          expenseTypeLabel: null,
          expenseStatusCode: '',
          expenseDate: DateTime.now(),
          countryCode: '',
          amountWithVat: null,
          vat: null,
          vatAmount: null,
          amountWithoutVat: null,
          description: '',
          fileName: '',
          fileDownloadLink: '',
          fileId: 0,
        );
      },
    );
    return expense;
  }
}
