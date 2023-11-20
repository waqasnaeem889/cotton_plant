import 'package:cotton_plant/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        width: screenWidth * 0.9,
        height: 55.h, // set the height as per your requirement
        child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: CustomColors.primary),
            onPressed: onPressed,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 16.sp,
              ),
            )));
  }
}
