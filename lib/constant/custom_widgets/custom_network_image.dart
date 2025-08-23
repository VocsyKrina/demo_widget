import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({super.key, required this.imageUrl, this.height, this.width, this.radius, this.memCacheHeight});

  final String imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final double? memCacheHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        // memCacheHeight: memCacheHeight?.toInt(),
        // imageBuilder: (context, imageProvider) => Container(
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(15.r),
        //         image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        //       ),
        //     ),
        placeholder: (context, url) => Container(color: Colors.grey, height: height, width: width),
        errorWidget: (context, url, error) => Icon(Icons.error_outline),
      ),
    );
  }
}

class SvgImage extends GetView {
  final String url;
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final BoxFit fit;

  const SvgImage(this.url, {super.key, this.color, this.height, this.width, this.onTap, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SvgPicture.asset(url, width: width, height: height, fit: fit, colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null),
    );
  }
}
