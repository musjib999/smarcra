import 'package:flutter/material.dart';
import 'package:smarcra/module/screens/expenses/expenses.dart';
import 'package:smarcra/module/screens/leaves/leaves.dart';
import 'package:smarcra/module/screens/timesheet/time_sheet.dart';

List<Widget> appBottomNavScreens = [
  const Timesheet(),
  const Leaves(),
  const Expenses(),
];
