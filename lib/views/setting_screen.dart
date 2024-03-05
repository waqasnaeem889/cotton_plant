// ignore_for_file: use_key_in_widget_constructors

import 'package:cotton_plant/controller/theme_controller.dart';
import 'package:cotton_plant/utils/contants.dart';
import 'package:cotton_plant/utils/theme.dart';
import 'package:cotton_plant/views/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     ColorScheme themeColor = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
          backgroundColor: themeColor.primary,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Image.asset("assets/images/launcher.png",
                height: 150.h,
                width: 150.w,
                fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.all(20.h),
                  child:  Divider(
                    color: themeColor.background,
                    thickness: 2,
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: (){
                      Get.to(()=> AboutScreen());
                    },
                    child: Container(
                      height: 50.h,
                      width: 332.w,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 30.w),
                      decoration: BoxDecoration(
                        color: themeColor.background,
                        borderRadius:
                            BorderRadius.circular(24), // White background color
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.primary
                                .withOpacity(0.3), // Light green shadow color
                            spreadRadius: 5, // Controls the spread of the shadow
                            blurRadius:
                                10, // Controls the blur effect of the shadow
                            offset: const Offset(
                                0, 3), // Controls the position of the shadow
                          ),
                        ],
                      ),
                      child: Text(
                        'About',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          color: themeColor.surface,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.w,
                ),
                Center(
                  child: Container(
                    height: 50.h,
                    width: 332.w,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    decoration: BoxDecoration(
                      color: themeColor.background,
                      borderRadius:
                          BorderRadius.circular(24), // White background color
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.primary
                              .withOpacity(0.3), // Light green shadow color
                          spreadRadius: 5, // Controls the spread of the shadow
                          blurRadius:
                              10, // Controls the blur effect of the shadow
                          offset: const Offset(
                              0, 3), // Controls the position of the shadow
                        ),
                      ],
                    ),
                    child: GetBuilder<ThemeController>(
                      builder: (tc) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tc.currentTheme == AppThemes.themeDataLight ? 'Light Mode' :'Dark Mode',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900,
                                color: themeColor.surface,
                              ),
                            ),
                            Switch(
                              activeColor: themeColor.primary,
                              activeTrackColor: themeColor.onTertiary,
                              inactiveThumbColor: themeColor.background,
                              inactiveTrackColor: themeColor.onTertiary,
                              splashRadius: 50.0,
                              // boolean variable value
                              value: tc.currentTheme == AppThemes.themeDataLight ? false: true,
                              // changes the state of the switch
                              onChanged: (value) {
                                if(tc.currentTheme == AppThemes.themeDataLight ){
                                  tc.changeTheme(ThemeOptions.dark);
                                }else{
                                   tc.changeTheme(ThemeOptions.light);
                                }
                              },
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                )
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 15.h),
                //   child: const DetailContainer(
                //       title: 'About',
                //       details:
                //           '''At Cotton Plant Disease App, we are driven by a shared passion for sustainable agriculture and a deep-rooted commitment to the cotton farming community. Our journey began with a simple yet powerful idea: to harness technology for the betterment of cotton farmers worldwide. Founded by a team of agricultural enthusiasts and experts, we are on a mission to empower farmers with the knowledge and tools they need to cultivate healthier, more productive cotton crops. With a focus on sustainability and responsible farming practices, we believe in the potential of modern technology to transform the cotton farming landscape. Our user-friendly app is designed to simplify the complexities of cotton farming, offering expert guidance on pest management, disease control, and optimized fertilization. We take pride in being part of a global community of cotton growers, and we invite you to join us on this journey towards a more prosperous and sustainable future for cotton farming.
                //       '''),
                // ),
              ],
            ),
          )),
    );
  }
}
