import 'package:cotton_plant/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondaryButton extends StatelessWidget {
  final double? width;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final String title;
  final double? height;
  final TextStyle? textStyle;
  const SecondaryButton(
      {super.key,
      this.width,
      this.textColor,
      this.backgroundColor,
      required this.onTap,
      required this.title,
      this.height,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          height: height ?? Get.height * 0.045,
          width: width ?? Get.width * 0.2),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? CustomColors.primary,
            // maximumSize:
            //     Size(width ?? Get.width, height ?? 45)
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          )),
    );
  }
}
