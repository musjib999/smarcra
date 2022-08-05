import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/module/auth/login.dart';
import 'package:smarcra/shared/themes/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12,
              ),
            ),
            indicatorColor: AppColors.primaryColor.withOpacity(0.3),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.bgColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoSlab',
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppColors.primaryColor),
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
      );
    });
  }
}
