
import 'package:flutter/material.dart';

class TimesheetModel{
  final String name;
  final String mission;
  final String period;
  final int presence;
  final int absence;
  late final Color color;
  TimesheetModel({required this.name, required this.mission, required this.period, required this.presence, required this.absence, this.color = const Color(0xffececec)});
}