// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimeSheetState on _TimeSheetState, Store {
  late final _$selectedTimeSheetsAtom =
      Atom(name: '_TimeSheetState.selectedTimeSheets', context: context);

  @override
  List<bool> get selectedTimeSheets {
    _$selectedTimeSheetsAtom.reportRead();
    return super.selectedTimeSheets;
  }

  @override
  set selectedTimeSheets(List<bool> value) {
    _$selectedTimeSheetsAtom.reportWrite(value, super.selectedTimeSheets, () {
      super.selectedTimeSheets = value;
    });
  }

  late final _$_TimeSheetStateActionController =
      ActionController(name: '_TimeSheetState', context: context);

  @override
  void generateSelectedTimeSheet(List<bool> selected) {
    final _$actionInfo = _$_TimeSheetStateActionController.startAction(
        name: '_TimeSheetState.generateSelectedTimeSheet');
    try {
      return super.generateSelectedTimeSheet(selected);
    } finally {
      _$_TimeSheetStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTimeSheets: ${selectedTimeSheets}
    ''';
  }
}
