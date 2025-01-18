import 'package:flutter/material.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';

class MyElevatedButtonThemeData extends ElevatedButtonThemeData {
  const MyElevatedButtonThemeData();

  @override
  ButtonStyle? get style {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(MyColors.bottomNavBackground),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
