import 'package:cotton_plant/controller/theme_controller.dart';
import 'package:cotton_plant/utils/theme.dart';
import 'package:cotton_plant/views/splash_display_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Import the generated file
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
SystemChrome.setSystemUIOverlayStyle(defaultOverlay);

  runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(context),
      builder: (tc) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: tc.currentTheme,
          home: const SplashScreen(), // Set IntroPage as the home page
        );
      }
    );
  }
}
