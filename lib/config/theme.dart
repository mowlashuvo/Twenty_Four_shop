import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.normal
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 10.sp,
      fontWeight: FontWeight.normal
    )
  );
}