import 'package:cotton_plant/controller/cotton_tips_controller.dart';
import 'package:cotton_plant/controller/user_controller.dart';
import 'package:cotton_plant/services/auth_service.dart';
import 'package:cotton_plant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
     ColorScheme themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(148, 28, 28, 0),
        elevation: 0,
        toolbarHeight: 50,
        leading: IconButton(
          icon: Image.asset(
            "assets/images/pot.png",
            width: 300.w,
            height: 180.h,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_outlined,
              color: themeColor.surface,
            ),
            onPressed: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
      body: Padding(
         padding: EdgeInsets.only(left: 20.h, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<UserController>(
              builder: (uc) {
                return Text(
                 uc.user == null ?'': 'Hi ${uc.user!.name}!',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color.fromRGBO(126, 123, 123, 1),
                  ),
                );
              }
            ),
            Padding(
              padding: EdgeInsets.only( bottom: 20.h),
              child: Text(
                'Empowering Farmers, Protecting Crops',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: themeColor.surface,
                ),
              ),
            ),
            Text(
                        'Some Cotton Planting tips:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: themeColor.primary,
                        ),
                      ),
            SizedBox(
              height: 20.h,
            ),
        
            GetBuilder<CottonTipsController>(
              builder: (ct) {
                return ct.isLoading ?  Center(child: Shimmer.fromColors(
                  baseColor: Colors.grey,
    highlightColor: Colors.white10,
                  
                  child: Container(
                    height: 400.h,
                    color: Colors.black26,
                    
                  ),
                )):
                Column(
                  children: [
                    Container(
                      height: ct.tip.length > 100 ?  350.h : 50.h ,
                      width: 400.w,
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: themeColor.primary),
                        borderRadius: BorderRadius.circular(16.r)
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                            ct.tip,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: themeColor.surface,
                            ),
                          ),
                      ),
                    ),
                   SizedBox(height: 10.h,),
                   CustomButton(text: 'More', onPressed: ()async{
                    await ct.loadTips();
                   },),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
