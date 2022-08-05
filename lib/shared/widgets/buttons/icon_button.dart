import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class PrimaryIconButton extends StatelessWidget {
  final IconData icon;
  final double? width;
  final dynamic Function(Function, Function, ButtonState)? onTap;
  final Color? color;
  const PrimaryIconButton(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.width = 200,
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
      child: Icon(
        icon,
        size: 45,
        color: Colors.white,
      ),
    );
  }
}
