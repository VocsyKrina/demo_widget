import 'package:demo_widgets/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constant/color.dart';
import 'constant/constant.dart';
import 'views/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Period Tracker',
          theme: ThemeData(
            textTheme: TextTheme(titleLarge: TextStyle(fontFamily: tommySoftRegular)),
            colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: blackColor, unselectedItemColor: blackColor.withValues(alpha: 0.2)),
            appBarTheme: AppBarTheme(
              backgroundColor: whiteColor,
              foregroundColor: whiteColor,
              scrolledUnderElevation: 0,
              iconTheme: IconThemeData(color: blackColor),
            ),
            scaffoldBackgroundColor: whiteColor,
          ),
          // translations: AppTranslations(),
          // locale: Locale(Storages.read('languageCode')),
          home: SplashScreen(),
          // home: MoodSelectionScreen(),
        );
      },
    );
  }
}
