import 'package:cotton_plant/services/auth_service.dart';
import 'package:cotton_plant/views/auth/signup_screen.dart';
import 'package:cotton_plant/widgets/auth_text_field.dart';
import 'package:cotton_plant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailError;
  String? passwordError;
  final authService = AuthService();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     ColorScheme themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Sign In to Your Account',
                    style: GoogleFonts.poppins(
                      color: themeColor.primary,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Welcome back you\'ve been missed',
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp, color: themeColor.primary),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextField(
                    leftIcon: const Icon(Icons.mail_rounded),
                    controller: emailController,
                    hintText: 'Email',
                    errorText: emailError,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Email Address";
                      }
                      if (!value.isEmail) {
                        return "Please enter proper Email Address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextField(
                    leftIcon: const Icon(Icons.lock),
                    isObscure: true,
                    controller: passwordController,
                    hintText: 'Password',
                    errorText: passwordError,
                    validator: (value) {
                      if (value!.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       Get.to(() => const ForgotPasswordScreen());
                      //     },
                      //     child: Text(
                      //       'Forgot Password?',
                      //       style: GoogleFonts.poppins(
                      //         fontWeight: FontWeight.w600,
                      //         color:  themeColor.primary,
                      //       ),
                      //     )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: 'Login',
                      onPressed: () async => await _handleLoginWithEmail(),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp, color: themeColor.tertiary),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const SignUpScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp, color: themeColor.primary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLoginWithEmail() async {
    if (_formKey.currentState!.validate()) {
      await authService.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }
  }
}
