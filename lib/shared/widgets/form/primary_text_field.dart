import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final bool obsecureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const PrimaryTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      this.obsecureText = false,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      controller: TextEditingController(),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12),
        suffixIcon: Icon(suffixIcon),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyText),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyText),
        ),
        label: Text(
          label,
          style: const TextStyle(fontSize: 13, color: AppColors.greyText),
        ),
      ),
    );
  }
}
