import 'package:demo_widgets/constant/custom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "Home page"),
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(child: SingleChildScrollView(child: Column())),
    );
  }
}
