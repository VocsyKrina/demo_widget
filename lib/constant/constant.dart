import 'dart:io';

import 'package:get/get.dart';

final String tommySoftBold = 'Tommy Soft Bold';
final String tommySoftRegular = 'Tommy Soft Regular';
final String tommySoftMedium = 'Tommy Soft Medium';
final RxString dateFormat = "dd/MM".obs;
final String darkerGrotesqueRegular = 'Darker Grotesque Regular';
// var previousCycleLength = 0.obs;
// var previousPeriodLength = 0.obs;

// String appName = "APPNAME";
class Statics {
  static String get appName => "APPNAME";
  static String get apiUrl => "https://vocsyinfotech.in/vocsy/laravel/ci-ovulation/api.php";

  static String get privacy => "https://vocsyinfotech.in/vocsy/laravel/ci-ovulation/privacyPolicy.php";
  // static String get terms => "https://vocsyapp.com/AndroidWorkPlanner/termsCondition.php";

  static String get shareApp {
    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=";
    } else if (Platform.isIOS) {
      return "https://apps.apple.com/in/app/";
    } else {
      return "Unsupported Platform ${Platform.operatingSystem}";
    }
  }
  //
  // /// FIREBASE INITIALIZE
  // static Future<void> firebaseInitFirebase() async {
  //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //
  //   /// automatically get breadcrumb logs to understand user actions leading up to a crash, non-fatal, or ANR event
  //   FlutterError.onError = (errorDetails) {
  //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  //   };
  //
  //   PlatformDispatcher.instance.onError = (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //     return true;
  //   };
  //
  //   /// This data can help you understand basic interactions, such as how many times your app was opened, and how many users were active in a chosen time period.
  //   FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  //   // if (Platform.isAndroid) {
  //   //   await getAndroidVersion();
  //   // }
  // }

  static String get rateApp {
    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=com.vocsy.ccdiaryworkplanner";
    } else if (Platform.isIOS) {
      return "https://itunes.apple.com/app/";
      return "https://itunes.apple.com/app/id6499462953?action=write-review";
    } else {
      return "Unsupported Platform ${Platform.operatingSystem}";
    }
  }
}
