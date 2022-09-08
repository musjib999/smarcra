import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/module/auth/login.dart';
import 'package:smarcra/shared/models/token_model.dart';
import 'package:smarcra/shared/models/user_model.dart';

import '../../data/local_data.dart';
import '../../shared/global/global_var.dart';
import '../../shared/widgets/home_bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        String? savedToken = await localData.getStringFromSp(key: 'token');
        String? savedUser = await localData.getStringFromSp(key: 'user');
        if (savedToken == null || savedUser == null) {
          si.routerService.popUntil(const Login(), context: context);
        } else {
          token = TokenModel.fromRawJson(savedToken);
          currentUser = UserModel.fromRawJson(savedUser);
          si.routerService.popUntil(
            context: context,
            HomeBottomNavigation(pages: appBottomNavScreens),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/smarcra-logo.png',
          height: 30.h,
          width: 50.w,
        ),
      ),
    );
  }
}
