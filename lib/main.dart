import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iouring_trading_app/config/routes/routes.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(useMaterial3: false).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: MyColors.scaffoldBackground,
        listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      routerConfig: routes,
    );
  }
}
