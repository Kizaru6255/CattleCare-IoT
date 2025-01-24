// ignore_for_file: unused_import, unused_field

import "package:cow_1/presentation/ui/screen/Splash_Screen/splash_screen_logic.dart";
import "package:cow_1/presentation/ui/screen/landing_page.dart";
import "package:cow_1/presentation/ui/utility/color_control.dart";
import "package:cow_1/presentation/ui/utility/image_base_url.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NextpageController _nextpageController = Get.put(NextpageController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimarySwatch.SpBg,
        elevation: 0,
      ),
      body: Container(
        color: PrimarySwatch.SpBg,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(ImageURL.splashScreenImage),
              const Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
