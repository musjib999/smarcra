import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData appLightTheme = ThemeData(
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 12,
        ),
      ),
      indicatorColor: AppColors.primaryColor.withOpacity(0.3),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.lato(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 13,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    )
);