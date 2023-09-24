import 'package:cotton_plant/utils/contants.dart';
import 'package:cotton_plant/views/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/cotton.png',
              // height: 509,
              width: 509.w,
              fit: BoxFit.fitWidth,
            ),
            Expanded(
              child: Container(
                color: CustomColors.primary,
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Detect a disease &\nsave our cotton',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          color: Color.fromARGB(255, 250, 245, 245),
                          fontSize: 24.sp,
                          //fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Detect a disease and help\nus to cure our cotton',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Color.fromARGB(255, 98, 240, 150),
                            fontSize: 20.sp,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50.h,
                        width: 160.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LandingPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(64, 152, 12, 1),
                            onPrimary: Colors.white,
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
