import 'package:cow_1/presentation/ui/screen/shedDetails.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../landing_page.dart'; // Replace with your actual import

class NextpageController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateBasedOnLoginStatus();
  }

  _navigateBasedOnLoginStatus() async {
    // Delay the navigation by 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check if the user is logged in
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // If the user is logged in, navigate to the ShadeDetails page
      Get.offAll(ShedDetails()); // Replace with your actual ShadeDetails page
    } else {
      // If the user is not logged in, navigate to the LandingPage (login)
      Get.offAll(const LandingPage()); // Replace with your actual landing page route
    }
  }
}
