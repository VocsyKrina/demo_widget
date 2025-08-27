import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import 'custom_network_image.dart';
import 'custom_sizedbox.dart';
import 'custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.height, this.width, this.isEnable = true, this.color = themeColor, this.titleColor, required this.onTap});

  final String text;
  final Color? color;
  final Color? titleColor;
  final bool isEnable;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onTap : () {},

      style: ElevatedButton.styleFrom(
        backgroundColor: isEnable ? color : themeColor.withValues(alpha: 0.5),
        foregroundColor: whiteColor,
        minimumSize: Size.fromHeight(height ?? 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.r), // Rounded edges
        ),
        elevation: 0,
      ),
      child: TextWidget(text, color: titleColor ?? whiteColor),
    );
  }
}

class SocialButton extends StatelessWidget {
  String? icon;
  final String text;
  final VoidCallback onPressed;

  SocialButton({super.key, required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 20.w),
        // q,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
          side: BorderSide(color: blackColor.withValues(alpha: 0.1), width: 1),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          icon != null ? SvgPicture.asset(icon!, height: 20.h, width: 20.w) : SizedBox(),
          SizedBoxW(width: icon != null ? 20 : 0),
          TextWidget(text),
        ],
      ),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const SocialIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.h,
        width: 60.h,
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: blackColor.withValues(alpha: 0.1), width: 1.w),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

class Back extends GetView {
  const Back({super.key, this.onTap, this.color, this.svgUrl});
  final VoidCallback? onTap;
  final Color? color;
  final String? svgUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap ?? () => Get.back(),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: SvgImage(svgUrl ?? "assets/icons/arrow_back.svg", color: color ?? Theme.of(context).colorScheme.primary, height: 20.w, width: 20.w, fit: BoxFit.scaleDown),
      ),
    );
  }
}
