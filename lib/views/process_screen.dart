// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProcessScreen extends StatelessWidget {
  File? coverImage;
  ProcessScreen({
    Key? key,
    this.coverImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Process'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
      ),
          body: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: 200.h,
                child: coverImage != null
                    ? Image.file(coverImage!)
                    : const  SizedBox()
              ),
            ],
          ));
  }
}
