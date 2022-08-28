import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/module/auth/login.dart';
import 'package:smarcra/shared/themes/light_theme.dart';

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
        title: 'Smarcra',
        theme: appLightTheme,
        home: const Login(),
      );
    });
  }
}
