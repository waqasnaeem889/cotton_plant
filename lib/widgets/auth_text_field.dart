// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final String? errorText;
  final Icon? leftIcon;
  final double? textFieldHeight;
  final bool? enabled;
  final String? initialValue; // Add initialValue property
  final VoidCallback? onTap;
  String? Function(String?)? validator;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isObscure = false,
    this.errorText,
    this.leftIcon,
    this.textFieldHeight = 60,
    this.enabled,
    this.initialValue, // Define initialValue property
    this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscure;
    _controller = widget.controller;
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onTap: widget.onTap,
      controller: _controller,
      obscureText: _obscureText,
      enabled: widget.enabled ?? true,
      style: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
        fontStyle: FontStyle.normal,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 12.sp),
        filled: true,
        fillColor: const Color(0x26AAAAAA),
        prefixIcon: widget.leftIcon?.color == null
            ? widget.leftIcon
            : Icon(widget.leftIcon?.icon, color: Colors.grey),
        suffixIcon: widget.isObscure
            ? GestureDetector(
                onTap: () => setState(() => _obscureText = !_obscureText),
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red,
            width: 3.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red,
            width: 3.w,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 18.sp, color: Colors.grey),
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
