import 'package:demo_widgets/notification_service.dart';
import 'package:demo_widgets/widgets/custom_appbar.dart';
import 'package:demo_widgets/widgets/custom_button.dart';
import 'package:demo_widgets/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_sizedbox.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "Home page"),
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextWidget("Home Screen", fontSize: 18.sp),
              SizedBoxH(height: 10),
              CustomButton(
                text: "Notification",
                onTap: () async {
                  final now = DateTime.now();
                  final scheduledTime = now.add(Duration(seconds: 20));

                  await NotificationService.showPeriodReminder(scheduledTime);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
