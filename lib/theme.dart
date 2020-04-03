import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';

ThemeData getTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: AppColors.theme,
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.idea,
          width: 1.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.idea,
          width: 1.5,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.idea,
          width: 1.5,
        ),
      ),
    ),
  );
}
