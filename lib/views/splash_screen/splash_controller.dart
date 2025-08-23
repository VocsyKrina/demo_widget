import 'package:get/get.dart';

import '../home_screen/home_screen.dart';

class SplashController extends GetxController {
  // final PeriodTracker tracker = Get.put(PeriodTracker());

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      // if (onboarding == true) {
      //   if (appPassword != "" && appPassword != null) {
      //     Get.offAll(() => EnterPassword());
      //   } else {
      //     if (isLogin == true) {
      //       if (userDetail == true) {
      //         tracker.loadHistory();
      Get.offAll(() => HomeScreen());
      //       } else {
      //         Get.offAll(() => UserDetailsScreen());
      //       }
      //     } else {
      //       Get.offAll(() => AuthOptionScreen());
      //     }
      //   }
      // } else {
      //   Get.offAll(() => OnboardingScreen());
      // }
    });
    super.onInit();
  }
}
