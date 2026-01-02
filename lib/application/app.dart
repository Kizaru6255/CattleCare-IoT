import 'package:cow_1/presentation/ui/screen/Splash_Screen/splash_screen.dart';
import "package:cow_1/presentation/ui/utility/color_control.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class CowProfileAndShedManagement extends StatelessWidget {
  CowProfileAndShedManagement({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: navigatorKey,
      home: const SplashScreen(),

      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: PrimarySwatch.appbarBG,
          ),
          primarySwatch: PrimarySwatch.primarySwatchColor,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: PrimarySwatch.indigatiorColor,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff53ac53))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff53ac53))),
          ),
          cardTheme: CardTheme(
            elevation: 3,
            shape: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0DAA4D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          )),
    );
  }
}
