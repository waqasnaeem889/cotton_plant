// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:io';

import 'package:cotton_plant/controller/disease_controller.dart';
import 'package:cotton_plant/model/dieases_model..dart';
import 'package:cotton_plant/services/firebase_storage_service.dart';
import 'package:cotton_plant/utils/contants.dart';
import 'package:cotton_plant/views/disease_detail_screen.dart';
import 'package:cotton_plant/widgets/custom_button.dart';
import 'package:cotton_plant/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProcessScreen extends StatelessWidget {
  File? coverImage;
  ProcessScreen({
    Key? key,
    this.coverImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColor = Theme.of(context).colorScheme;
    return GetBuilder<DiseaseController>(
        init: DiseaseController(),
        builder: (dc) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Process'),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: themeColor.primary, width: 2),
                          borderRadius: BorderRadius.circular(8.r)),
                      width: Get.width,
                      height: 200.h,
                      child: coverImage != null
                          ? Image.file(coverImage!)
                          : const SizedBox()),
                  SizedBox(
                    height: 20.h,
                  ),
                  dc.disease.id.isEmpty
                      ? CustomButton(
                          onPressed: () async {
                            String url = '';
                            if (coverImage != null) {
                              showLoadingDialog(message: 'Processing..!!!');
                              url =
                                  await FirebaseStorageServices.uploadToStorage(
                                      file: coverImage!,
                                      folderName: 'diseaseImages',
                                      showDialog: false);
                              await dc.getDiseaseName(url);
                              hideLoadingDialog();
                            } else {
                              hideLoadingDialog();
                              Fluttertoast.showToast(
                                  msg: 'Please Upload Image');
                            }
                          },
                          text: 'Check Disease')
                      : Column(children: [
                          dc.disease != 'Disease Not Found!'
                              ? dc.disease.id  == '3'?  Text(
                                       'No disease found !. Its a ${dc.disease.name}',
                                       textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16.sp),
                                      ): Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text(
                                        'Disease Name is:  ',
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      Text(
                                        dc.disease.name,
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ])
                              : Text(
                                  'Disease Not Found!',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                          SizedBox(
                            height: 20.h,
                          ),
                          dc.disease.id == '3' ? const  SizedBox(): CustomButton(
                              text: 'Learn More',
                              onPressed: () {
                                Get.to(() => DiseaseDetailScreen(
                                  image: coverImage!,
                                    disease: dc.disease.id == '0'
                                        ? aphids
                                        : dc.disease.id == '1'
                                            ? armyWorm
                                            : dc.disease.id == '2'
                                                ? bacterialBlight
                                                : dc.disease.id == '4'
                                                    ? powderyMidew
                                                    : targetSpot));
                              }),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: const Divider(
                              color: CustomColors.primary,
                            ),
                          ),
                          CustomButton(
                            text: 'Retry ',
                            onPressed: () {
                              Get.back();
                            },
                          )
                        ])
                ],
              ));
        });
  }
}
