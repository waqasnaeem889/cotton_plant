// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';

import 'package:cotton_plant/controller/cotton_tips_controller.dart';
import 'package:cotton_plant/views/home_screen.dart';
import 'package:cotton_plant/views/process_screen.dart';
import 'package:cotton_plant/views/setting_screen.dart';
import 'package:cotton_plant/widgets/custom_dialogbox.dart';
import 'package:cotton_plant/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    const HomePageScreen(),
    SettingScreen(),
  ];

  final ImagePicker picker = ImagePicker();
  File? coverImage;

  Future<dynamic> _handleImagePicker(BuildContext context) {
    
    return showDialog(
      context: context,
      builder: (context) {
        return CustomDialogBox(
            height: 180.h,
            title: 'Pick Image',
            description: 'Choose anyone option',
            action: Column(
              children: [
                SecondaryButton(
                    title: 'Camera',
                    width: 200.w,
                    onTap: () async {
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        setState(() {
                          coverImage = File(image.path);
                        });
                        Navigator.of(context).pop();
                        Get.to(() => ProcessScreen(coverImage: coverImage));
                      } else {
                        Navigator.of(context).pop();
                      }
                    }),
                SizedBox(height: 20.h),
                SecondaryButton(
                    title: 'Gallery',
                    width: 200.w,
                    onTap: () async {
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          coverImage = File(image.path);
                        });
                        Navigator.of(context).pop();
                        Get.to(() => ProcessScreen(coverImage: coverImage));
                      } else {
                        Navigator.of(context).pop();
                      }
                    })
              ],
            ));
      },
    );
  } // Track the selected index

  @override
  Widget build(BuildContext context) {
     ColorScheme themeColor = Theme.of(context).colorScheme;
    return GetBuilder<CottonTipsController>(
      init: CottonTipsController(),
      builder: (ct) {
        return Scaffold(
          body: screens[_selectedIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _handleImagePicker(context);
            },
            elevation: 0,
            backgroundColor: const Color(0xFF85C556),
            child: ClipOval(
              child: SizedBox(
                width: 30.w,
                height: 35.h,
                child: Image.asset(
                  "assets/images/scan.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: themeColor.background,
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              height: 56.h,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildIconButton(0, Icons.home),
                  //_buildIconButton(1, Icons.search),
                  SizedBox(width: 32.w),
                  _buildIconButton(1, Icons.info,
                      iconSize:
                          24.h), // Use your custom information icon image here
                  //_buildIconButton(3, Icons.person_outlined),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildIconButton(int index, dynamic icon, {double iconSize = 24.0}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: iconSize,
            color: _selectedIndex == index ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });

            // Perform navigation based on the selected index
            switch (index) {
              case 0:
                setState(() {
                  _selectedIndex = 0; // Set the home icon as selected
                });
                break;
              case 1:
                setState(() {
                  _selectedIndex = 1;
                });
                break;
            }
          },
        ),
        if (_selectedIndex == index)
          Positioned(
            top: 0,
            child: Container(
              width: 7.w,
              height: 8.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
      ],
    );
  }
}
