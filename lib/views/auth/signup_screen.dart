import 'package:cotton_plant/services/auth_service.dart';
import 'package:cotton_plant/views/auth/login_screen.dart';
import 'package:cotton_plant/widgets/auth_text_field.dart';
import 'package:cotton_plant/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Import any other required classes and widgets here

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
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
                    'Create an Account',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.sp,
                      color: themeColor.primary,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Join our community and start your journey',
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp, color: themeColor.primary),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    leftIcon: const Icon(Icons.person),
                    controller: usernameController,
                    hintText: 'User name',
                    errorText: emailError,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Username";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextField(
                    leftIcon: const Icon(Icons.mail),
                    controller: emailController,
                    hintText: 'Enter Email',
                    errorText: emailError,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Email Address";
                      }
                      if (!value.isEmail) {
                        return "Please Enter Proper Email Address";
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
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                        text: 'Sign Up',
                        onPressed: () async => await _handleSignUp()),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: themeColor.tertiary,
                      ),
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            color: themeColor.primary,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get
                                ..back()
                                ..to(() => const LoginScreen());
                            },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      await authService.signUpWithEmailAndPassword(
        username: usernameController.text.trim(),
        emailAddress: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.back();
    }
  }
}
