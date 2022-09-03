import 'package:mobx/mobx.dart';

// Include generated file
part 'timesheet_state.g.dart';

// This is the class used by rest of your codebase
class TimeSheetState = _TimeSheetState with _$TimeSheetState;

// The store-class
abstract class _TimeSheetState with Store {
  @observable
  List<bool> selectedTimeSheets = [];

  @action
  void generateSelectedTimeSheet(List<bool> selected) {
    selectedTimeSheets = selected;
  }
  void selectTimeSheet({required bool value, required int index}){
    selectedTimeSheets[index] = value;
  }
}