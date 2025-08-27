import 'package:demo_widgets/widgets/custom_sizedbox.dart';
import 'package:demo_widgets/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import '../constant/constant.dart';

class TextFieldWidget extends GetView {
  const TextFieldWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.boolValid,
    this.width,
    this.focusNode,
    this.valid,
    this.paddingH,
    this.paddingv,
    this.onChanged,
    this.onSubmitted,
    this.maxLan,
    this.suffixIcon,
    this.prefixIcon,
    this.minLine,
    this.textInputAction,
    this.maxLine,
    this.expands,
    this.keyboardType = TextInputType.text,
    this.enabled,
    this.textInputFormatter,
    this.onTap,
    this.borderColor,
    this.color,
    this.textAlign,
    this.containerColor,
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? labelText;

  final bool? expands;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final double? width;
  final List<TextInputFormatter>? textInputFormatter;
  final double? paddingH;
  final double? paddingv;
  final String? Function(String?)? valid;
  final bool? Function(bool)? boolValid;
  final bool obscureText;
  final int? maxLan;
  final int? maxLine;
  final int? minLine;
  final bool? enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final Color? color;
  final TextAlign? textAlign;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          labelText != null ? TextWidget(labelText!, fontSize: 16.sp, fontWeight: FontWeight.w400) : SizedBox(),
          SizedBoxH(height: labelText != null ? 10.h : 0),
          TextFormField(
            onTap: onTap,
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            enabled: enabled,
            onFieldSubmitted: onSubmitted,
            inputFormatters: textInputFormatter,
            readOnly: enabled ?? false,
            maxLines: maxLine ?? 1,
            minLines: minLine ?? 1,
            maxLength: maxLan,
            expands: expands ?? false,
            validator: valid,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            style: TextStyle(fontSize: 14.sp, fontFamily: tommySoftRegular, color: blackColor),
            autofocus: false,
            cursorColor: blackColor,
            textAlign: textAlign ?? TextAlign.start,
            decoration: InputDecoration(
              counterText: '',
              hintText: hintText,
              // counterStyle: TextStyle(color: color ?? textColor()),
              contentPadding: EdgeInsets.symmetric(vertical: paddingH ?? 15.h, horizontal: paddingv ?? 30.w),
              filled: true,
              fillColor: Colors.transparent,

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                borderSide: BorderSide(width: 1.w, color: borderColor ?? blackColor.withValues(alpha: 0.1)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                borderSide: BorderSide(width: 1.w, color: borderColor ?? blackColor.withValues(alpha: 0.1)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                borderSide: BorderSide(width: 1.w, color: borderColor ?? blackColor.withValues(alpha: 0.1)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                borderSide: BorderSide(width: 1.w, color: borderColor ?? blackColor.withValues(alpha: 0.1)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                borderSide: BorderSide(width: 1.w, color: themeColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                borderSide: BorderSide(width: 1.w, color: themeColor),
              ),
              hintStyle: TextStyle(fontSize: 14.sp, fontFamily: tommySoftRegular, color: blackColor.withValues(alpha: 0.5)),
              errorStyle: TextStyle(fontSize: 12.sp, fontFamily: tommySoftRegular, color: themeColor),
              suffixIconConstraints: BoxConstraints(minHeight: 20.h, minWidth: 20.w),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              prefixIconConstraints: BoxConstraints(minHeight: 20.h, minWidth: 20.w),
            ),
            // ),
          ),
        ],
      ),
    );
  }
}
