import 'package:cotton_plant/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final double? height;
  final Widget action;
  const CustomDialogBox(
      {super.key,
      required this.title,
      required this.description,
      this.height,
      required this.action});

  @override
  Widget build(BuildContext context) {
     ColorScheme themeColor = Theme.of(context).colorScheme;
    return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w900,
            color: CustomColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
        content: Container(
          height: height ?? Get.height * 0.25,
          decoration: const BoxDecoration(shape: BoxShape.rectangle),
          child: Column(
            children: [
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                  color: themeColor.surface,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              action
            ],
          ),
        ));
  }
}
