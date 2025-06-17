import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/constants/colors.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    this.validator,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    required this.textInputAction,
    required this.prefixIcon,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      validator: validator,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onTap: () {},
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500]!,
          fontSize: 14.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          size: 24.sp,
          color: Colors.grey[500]!,
        ),
      ),
    );
  }
}
