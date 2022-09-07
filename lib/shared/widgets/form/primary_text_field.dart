import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final bool obsecureText;
 final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
 final String? Function(String?)? validator;
  const PrimaryTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      this.obsecureText = false,
        this.keyboardType,
        this.validator,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12),
        suffixIcon: suffixIcon,
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
