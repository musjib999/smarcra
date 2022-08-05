import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/shared/global/global_var.dart';
import 'package:smarcra/shared/themes/colors.dart';
import 'package:smarcra/shared/widgets/buttons/icon_button.dart';
import 'package:smarcra/shared/widgets/buttons/primary_button.dart';
import 'package:smarcra/shared/widgets/buttons/social_button.dart';
import 'package:smarcra/shared/widgets/form/primary_text_field.dart';
import 'package:smarcra/shared/widgets/home_bottom_nav.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Image.asset(
                'assets/images/smarcra-logo.png',
                height: 120,
              ),
              const SizedBox(height: 15),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: AppColors.greyText,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              SizedBox(height: 40.sp),
              PrimaryTextField(
                controller: TextEditingController(),
                label: 'Email',
                prefixIcon: Icons.email,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 15),
              PrimaryTextField(
                controller: TextEditingController(),
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility_off_outlined,
                label: 'Password',
                hintText: 'Password',
                obsecureText: true,
              ),
              SizedBox(height: 15.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        side: const BorderSide(color: AppColors.greyText),
                        onChanged: (val) {
                          setState(() {
                            rememberMe = val!;
                          });
                        },
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(
                          color: AppColors.greyText,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    title: 'Sign In',
                    onTap: (startLoading, stopLoading, btnState) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return HomeBottomNavigation(
                                pages: appBottomNavScreens);
                          }),
                        ),
                      );
                    },
                    width: 68.w,
                  ),
                  const SizedBox(width: 8.0),
                  PrimaryIconButton(
                    icon: Icons.fingerprint,
                    onTap: null,
                    width: 20.w,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    width: 90,
                    child: Divider(),
                  ),
                  // SizedBox(width: 5),
                  Text(
                    'Or continue with',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyText,
                    ),
                  ),
                  // SizedBox(width: 5),
                  SizedBox(
                    width: 90,
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SocialButton(
                      title: 'Google',
                      color: const Color(0xFFF44336),
                      icon: Ionicons.logo_google,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 15.sp),
                  Expanded(
                    child: SocialButton(
                      title: 'facebook',
                      color: Colors.blue,
                      icon: Ionicons.logo_facebook,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 35.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(fontSize: 12),
                  ),
                  InkWell(
                    onTap: null,
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
