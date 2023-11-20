import 'package:cotton_plant/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      content: SizedBox(
          width: 250,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(CustomColors.primary),
              ),
              SizedBox(width: 20.w),
              Text(
                message,
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, color: CustomColors.primary),
              )
            ],
          )),
    );
  }
}

void showLoadingDialog({required String message}) {
  Get.dialog(
    LoadingDialog(message: message),
    barrierDismissible: false,
    name: message,
  );
}

void hideLoadingDialog() {
  Get.back();
  return;
}
