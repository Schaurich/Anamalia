// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resize/resize.dart';
import 'colors.dart';

ThemeData getmainTheme(BuildContext context) {
  final primary = <int, Color>{
    50: const Color.fromRGBO(44, 40, 94, .1),
    100: const Color.fromRGBO(44, 40, 94, .2),
    200: const Color.fromRGBO(44, 40, 94, .3),
    300: const Color.fromRGBO(44, 40, 94, .4),
    400: const Color.fromRGBO(44, 40, 94, .5),
    500: const Color.fromRGBO(44, 40, 94, .6),
    600: const Color.fromRGBO(44, 40, 94, .7),
    700: const Color.fromRGBO(44, 40, 94, .8),
    800: const Color.fromRGBO(44, 40, 94, .9),
    900: const Color.fromRGBO(44, 40, 94, 1),
  };

  return ThemeData(
    primarySwatch: MaterialColor(0xFF2C285E, primary),
    colorScheme: const ColorScheme.light().copyWith(
      primary: Theme.of(context).colorScheme.purple,
      onPrimary: Colors.white,
      secondary: Theme.of(context).colorScheme.lightPurple,
      onSecondary: const Color(0xFF8C8C8C),
      tertiary: Theme.of(context).colorScheme.lightGreen,
      onError: Theme.of(context).colorScheme.red,
      // background: Colors.grey[200],
      // onBackground: Colors.grey[600],
    ),
    textTheme: TextTheme(
      // headline1: TextStyle(
      //   fontWeight: FontWeight.w700,
      //   height: 80 / 64,
      //   fontSize: 32.sp,
      //   color: Theme.of(context).colorScheme.weBroHeadTextColor,
      // ),
      // headline2: TextStyle(
      //   fontWeight: FontWeight.w700,
      //   height: 64 / 48,
      //   fontSize: 25.6.sp,
      //   color: Theme.of(context).colorScheme.weBroHeadTextColor,
      // ),
      // headline3: TextStyle(
      //   fontWeight: FontWeight.w700,
      //   height: 1.5,
      //   fontSize: 19.2.sp,
      //   color: Theme.of(context).colorScheme.weBroHeadTextColor,
      // ),
      // headline4: TextStyle(
      //   fontWeight: FontWeight.w700,
      //   height: 1.5,
      //   fontSize: 16.sp,
      //   color: Theme.of(context).colorScheme.weBroHeadTextColor,
      // ),
      // headline5: TextStyle(
      //   fontWeight: FontWeight.w700,
      //   height: 1.5,
      //   fontSize: 14.4.sp,
      //   color: Theme.of(context).colorScheme.weBroHeadTextColor,
      // ),
      // headline6: TextStyle(
      //   fontWeight: FontWeight.w700,
      //   height: 28 / 18,
      //   fontSize: 13.6.sp,
      //   color: Theme.of(context).colorScheme.weBroHeadTextColor,
      // ),
      // subtitle1: TextStyle(
      //   fontWeight: FontWeight.w600,
      //   height: 1.5,
      //   fontSize: 12.8.sp,
      // ),
      // subtitle2: TextStyle(
      //   fontWeight: FontWeight.w600,
      //   height: 22 / 14,
      //   fontSize: 11.2.sp,
      // ),

      bodyText1: GoogleFonts.raleway(
        height: 1.4,
        fontSize: 16.sp,
        color: Theme.of(context).colorScheme.grey,
        fontWeight: FontWeight.w500,
      ),

      bodyText2: GoogleFonts.raleway(
        height: 1.sp,
        fontSize: 12.sp,
        color: const Color(0xFF4F4F4F),
        fontWeight: FontWeight.w500,
      ),

      subtitle1: GoogleFonts.raleway(
        color: const Color(0xFF4F4F4F),
        height: 1.4.sp,
        fontSize: 12.8.sp,
      ),

      // subtitle2: GoogleFonts.raleway(
      //   height: 22 / 14,
      //   fontSize: 11.2.sp,
      // ),

      caption: GoogleFonts.raleway(
        height: 1.4.sp,
        fontSize: 9.6.sp,
      ),
    ),
  );
}
