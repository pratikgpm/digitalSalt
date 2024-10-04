import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'poppins',
      scaffoldBackgroundColor: Pallete.whiteColor,
    );
  }
}