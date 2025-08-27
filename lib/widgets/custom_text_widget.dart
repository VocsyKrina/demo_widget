import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import '../constant/constant.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final Color? color;
  final double? letterSpacing;
  final TextAlign? align;
  final double? height;
  final FontWeight? fontWeight;
  final bool strike;
  final int? maxLines;
  final bool underline;
  final TextOverflow? overflow;

  const TextWidget(
    this.text, {
    super.key,
    this.fontSize,
    this.fontFamily,
    this.color,
    this.letterSpacing,
    this.align,
    this.height,
    this.fontWeight,
    this.strike = false,
    this.maxLines,
    this.underline = false,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: align ?? TextAlign.left,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? blackColor,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 0,
        fontFamily: fontFamily ?? tommySoftRegular,
        decorationColor: color,
        decoration: underline
            ? TextDecoration.underline
            : strike
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}
