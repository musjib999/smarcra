import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/shared/themes/colors.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final double? width;
  final dynamic Function(Function, Function, ButtonState)? onTap;
  final Color? color;
  const SecondaryButton(
      {Key? key,
        required this.title,
        required this.icon,
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
      minWidth: 200,
      loader: Container(
        padding: const EdgeInsets.all(10),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 17,),
          ),
          SizedBox(width: 5.sp),
          Text(
            title,
            style:
            TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 10.sp
            ),
          ),
        ],
      ),
    );
  }
}
