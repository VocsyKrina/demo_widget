import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';
import '../constant.dart';
import 'custom_text_widget.dart';

class CustomCupertinoPicker extends StatelessWidget {
  CustomCupertinoPicker({super.key, required this.items, this.height, this.suffixText, required this.selectedValue, required this.onSelectedItemChanged});

  List<String> items;
  String? suffixText;
  int selectedValue;
  double? height;
  double? diameterRatio;
  double? squeeze;
  double? magnification;
  ValueChanged<int> onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    int initialIndex = items.indexOf(selectedValue.toString().padLeft(2, '0'));

    return SizedBox(
      width: 105.w,
      height: height ?? 300.h,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: initialIndex),
        itemExtent: 60.h,
        onSelectedItemChanged: onSelectedItemChanged,
        useMagnifier: true,
        diameterRatio: diameterRatio ?? 5.0,
        squeeze: squeeze ?? 0.9,
        magnification: magnification ?? 1.0,
        selectionOverlay: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(color: themeColor, width: 1.w),
            ),
          ),
          child: suffixText != null
              ? Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(suffixText ?? "", fontSize: 14.sp, color: blackColor.withValues(alpha: 0.5), fontFamily: tommySoftRegular),
                )
              : SizedBox(),
        ),
        children: items
            .map(
              (item) => Center(
                child: TextWidget(item, fontSize: 18.sp, color: blackColor, fontFamily: tommySoftMedium),
              ),
            )
            .toList(),
      ),
    );
  }
}
