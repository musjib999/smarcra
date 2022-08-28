import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smarcra/shared/themes/colors.dart';

class DatePickerContainer extends StatelessWidget {
  final String date;
  const DatePickerContainer({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyText,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child:  ListTile(
        leading: const Icon(Ionicons.calendar_outline),
        title: Text(date, style: const TextStyle(
          color: AppColors.greyText,
        ),),
      ),
    );
  }
}
