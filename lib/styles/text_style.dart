import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_test_app/assets/font_family.dart';
import 'package:movie_flutter_test_app/styles/app_colors.dart';

class AppTextStyle {
  static TextStyle size24ColorWhite = const TextStyle(
      fontSize: 24.0, color: Colors.white, fontFamily: AppFonts.poppinsBlack);
  static TextStyle size24ColorBlack = const TextStyle(
      fontSize: 24.0, color: Colors.black, fontFamily: AppFonts.poppinsBlack);
  static TextStyle size20ColorWhite = const TextStyle(
      fontSize: 20.0, color: Colors.blue, fontFamily: AppFonts.poppinsBlack);
  static TextStyle size18ColorBlack = const TextStyle(
      fontSize: 18.0, color: Colors.black, fontFamily: AppFonts.poppinsBlack);
  static TextStyle size14Colorprimary = const TextStyle(
      fontSize: 14.0,
      color: Color(AppColor.primaryColor),
      fontFamily: AppFonts.poppinsBlack);
  static TextStyle size18Colorblack = const TextStyle(
      fontSize: 18.0, color: Colors.black, fontFamily: AppFonts.poppinsBlack);
}
