import 'package:flutter/material.dart';

class UtilityService{
  List<DropdownMenuItem> getDropdownItems(List items) {
    List<DropdownMenuItem<dynamic>> dropdownItems = [];

    for (var item in items) {
      var newItem = DropdownMenuItem(
        value: item,
        child: Text('$item'),
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }
}