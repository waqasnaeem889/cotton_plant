import 'package:cotton_plant/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    super.key,
    required this.title,
    required this.details,
  });

  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // White background color
        boxShadow: [
          BoxShadow(
            color: CustomColors.primary
                .withOpacity(0.3), // Light green shadow color
            spreadRadius: 5, // Controls the spread of the shadow
            blurRadius: 10, // Controls the blur effect of the shadow
            offset: const Offset(0, 3), // Controls the position of the shadow
          ),
        ],
      ),
      child: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,

            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.underline, // Add underline
            decorationColor: Colors.white, // Color of the underline
            decorationThickness: 2,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          details,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,

            // fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ]),
    );
  }
}
