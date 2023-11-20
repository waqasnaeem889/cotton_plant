import 'package:cotton_plant/controller/auth_controller.dart';
import 'package:cotton_plant/controller/user_controller.dart';
import 'package:cotton_plant/views/auth/login_screen.dart';
import 'package:cotton_plant/views/landing_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthWrapper extends StatelessWidget {
  AuthWrapper({super.key});
  final ac = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ac.user == null) {
        return const LoginScreen();
      } else {
        if (!Get.isRegistered<UserController>()) {
          Get.put(UserController(), permanent: true);
        }
        // final uc = Get.find<UserController>();
        return LandingPage();
      }
    });
  }
}
