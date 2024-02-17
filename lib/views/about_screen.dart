// ignore_for_file: use_key_in_widget_constructors

import 'package:cotton_plant/utils/contants.dart';
import 'package:cotton_plant/widgets/detail_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColors.primary,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 15.h),
              child: const DetailContainer(
                  title: 'About',
                  details:
                      '''At Cotton Plant Disease App, we are driven by a shared passion for sustainable agriculture and a deep-rooted commitment to the cotton farming community. Our journey began with a simple yet powerful idea: to harness technology for the betterment of cotton farmers worldwide. Founded by a team of agricultural enthusiasts and experts, we are on a mission to empower farmers with the knowledge and tools they need to cultivate healthier, more productive cotton crops. With a focus on sustainability and responsible farming practices, we believe in the potential of modern technology to transform the cotton farming landscape. Our user-friendly app is designed to simplify the complexities of cotton farming, offering expert guidance on pest management, disease control, and optimized fertilization. We take pride in being part of a global community of cotton growers, and we invite you to join us on this journey towards a more prosperous and sustainable future for cotton farming.
                  '''),
            ),
          )),
    );
  }
}
