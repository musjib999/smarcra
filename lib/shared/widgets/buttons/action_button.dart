import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/shared/themes/colors.dart';

class ActionButtion extends StatelessWidget {
  final IconData icon;
  final String title;
  const ActionButtion({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
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
              child: Icon(icon, color: Colors.white, size: 18,),
          ),
          SizedBox(width: 5.sp),
          Text(title, style:
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
