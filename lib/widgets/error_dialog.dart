// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.message, this.showOkButton = true})
      : super(key: key);
  final String message;
  final bool showOkButton;
  @override
  Widget build(BuildContext context) {
    ColorScheme themeColor = Theme.of(context).colorScheme;
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      elevation: 0,
      title: Center(
          child: Text('Error',
              style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.red))),
      content: Text(message,
          textAlign: TextAlign.center,
          style:
              GoogleFonts.poppins(fontSize: 16.sp, color: themeColor.tertiary)),
      actions: <Widget>[
        showOkButton
            ? TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Ok',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: themeColor.tertiary,
                    )))
            : const SizedBox()
      ],
    );
  }
}

Future<void> showErrorDialog(String message) {
  return Get.dialog(ErrorDialog(
    message: message,
  ));
}

Future<void> showNoNetworkDialog() {
  return Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: const ErrorDialog(
          showOkButton: false,
          message: "No internet connection",
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.75));
}
