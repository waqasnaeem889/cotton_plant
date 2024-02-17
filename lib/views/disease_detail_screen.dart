import 'package:cotton_plant/model/dieases_model..dart';
import 'package:cotton_plant/utils/contants.dart';
import 'package:cotton_plant/widgets/detail_container.dart';
import 'package:cotton_plant/widgets/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DiseaseDetailScreen extends StatelessWidget {
  final DiseaseModel disease;
  const DiseaseDetailScreen({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          disease.diseaseName,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Hero(
              tag: disease.diseaseName,
              child: Container(
                margin: EdgeInsets.only(left: 60.w, right: 60.w),
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primary
                          .withOpacity(0.3), // Light green shadow color
                      spreadRadius: 5, // Controls the spread of the shadow
                      blurRadius: 10, // Controls the blur effect of the shadow
                      offset: const Offset(
                          0, 3), // Controls the position of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(disease.diseaseImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            DetailContainer(
              title: 'Description:',
              details: disease.diseaseDescription,
            ),
            const CustomDivider(),
            DetailContainer(
              title: 'Control Methods:',
              details: disease.diseaseControlMethod,
            ),
            const CustomDivider(),
            DetailContainer(
              title: 'Fertilization:',
              details: disease.diseaseFertilization,
            ),
          ],
        ),
      ),
    );
  }
}
