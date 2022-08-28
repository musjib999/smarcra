import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/shared/themes/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double? width;
  final dynamic Function(Function, Function, ButtonState)? onTap;
  final Color? color;
  const PrimaryButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.width = 500,
      this.color = AppColors.primaryColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: 55,
      width: width!,
      borderRadius: 8.0,
      color: color,
      loader: Container(
        padding: const EdgeInsets.all(10),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
