import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color.dart';
import '../constant/constant.dart';
import 'custom_text_widget.dart';

PreferredSizeWidget customAppbar({required String title, String? svgUrl, bool centerTittle = false, List<Widget>? actionWidget}) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 60.h,
    // leading: Back(svgUrl: svgUrl),
    title: TextWidget(title, fontSize: 18.sp, fontFamily: tommySoftMedium),
    actions: actionWidget,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.h),
      child: Container(color: blackColor.withValues(alpha: 0.2), height: 1.h),
    ),
  );
}
