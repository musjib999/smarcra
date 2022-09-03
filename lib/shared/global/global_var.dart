import 'package:flutter/material.dart';
import 'package:smarcra/core/state_management/timesheet_state.dart';
import 'package:smarcra/module/screens/expenses/expenses.dart';
import 'package:smarcra/module/screens/leaves/leaves.dart';
import 'package:smarcra/module/screens/timesheet/time_sheet.dart';
import 'package:smarcra/shared/models/token_model.dart';
import 'package:smarcra/shared/models/user_model.dart';

late TokenModel token;
late UserModel currentUser;

TimeSheetState timeSheetState = TimeSheetState();

List<Widget> appBottomNavScreens = [
  const Timesheet(),
  const Leaves(),
  const Expenses(),
];
