import 'package:smarcra/shared/models/expense_model.dart';

import '../shared/models/leave_model.dart';
import '../shared/models/timesheet_model.dart';

List<TimesheetModel> timesheets = [
  TimesheetModel(name: 'John', mission: 'MMA', period: 'Mai', presence: 20, absence: 0),
  TimesheetModel(name: 'Abdul', mission: 'discrete assurance', period: 'Mai', presence: 15, absence: 0),
  TimesheetModel(name: 'Musa', mission: 'discrete assurance', period: 'Mai', presence: 25, absence: 0),
  TimesheetModel(name: 'Paul', mission: 'MMA', period: 'Mai', presence: 12, absence: 3),
  TimesheetModel(name: 'John', mission: 'MMA', period: 'Mai', presence: 20, absence: 0),
  TimesheetModel(name: 'Abdul', mission: 'discrete assurance', period: 'Mai', presence: 15, absence: 0),
  TimesheetModel(name: 'Musa', mission: 'discrete assurance', period: 'Mai', presence: 25, absence: 0),
  TimesheetModel(name: 'Paul', mission: 'MMA', period: 'Mai', presence: 12, absence: 3),
  TimesheetModel(name: 'John', mission: 'MMA', period: 'Mai', presence: 20, absence: 0),
  TimesheetModel(name: 'Abdul', mission: 'discrete assurance', period: 'Mai', presence: 15, absence: 0),
  TimesheetModel(name: 'Musa', mission: 'discrete assurance', period: 'Mai', presence: 25, absence: 0),
  TimesheetModel(name: 'Paul', mission: 'MMA', period: 'Mai', presence: 12, absence: 3),
];

List<TimesheetModel> editTimesheetData = [
  TimesheetModel(name: 'Lundi', mission: '1', period: '8h', presence: 20, absence: 0),
  TimesheetModel(name: 'Mardi', mission: '2', period: '2h', presence: 15, absence: 0),
  TimesheetModel(name: 'Mercredi', mission: '1', period: '3h', presence: 25, absence: 0),
  TimesheetModel(name: 'Samedi', mission: '1', period: '4d', presence: 12, absence: 3),
];

List<LeaveModel> leaves = [
  // LeaveModel(name: 'MArc', startDate: DateTime.now(), stopDate: DateTime.now(), status: 'Validated'),
  // LeaveModel(name: 'James', startDate: DateTime.now(), stopDate: DateTime.now(), status: 'Submitted'),
  // LeaveModel(name: 'Paul', startDate: DateTime.now(), stopDate: DateTime.now(), status: 'Validated'),
  // LeaveModel(name: 'Musa', startDate: DateTime.now(), stopDate: DateTime.now(), status: 'Submitted'),
];

List<ExpenseModel> expenses = [
  // ExpenseModel(name: 'MArc', startDate: DateTime.now(), type: 'Hostel fee', amount: 30, status: 'Validated'),
  // ExpenseModel(name: 'Pierre', startDate: DateTime.now(), type: 'Hostel fee', amount: 50, status: 'Submitted'),
  // ExpenseModel(name: 'MArc', startDate: DateTime.now(), type: 'Hostel fee', amount: 20, status: 'Validated'),
];