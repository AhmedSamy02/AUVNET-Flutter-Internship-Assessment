import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/assets.dart';
import 'package:nawel/core/constants/colors.dart';
import 'package:nawel/core/constants/screens.dart';
import 'package:nawel/features/auth/presentation/widgets/auth_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                width: 310.w,
                height: 310.h,
                kLogo,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AuthTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          hintText: 'Email',
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          prefixIcon: Icons.email_outlined,
                        ),
                        SizedBox(height: 16.h),
                        AuthTextFormField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          prefixIcon: Icons.lock_outline,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, kLoginScreen);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            fixedSize: Size(
                              MediaQuery.of(context).size.width,
                              45.h,
                            ),
                          ),
                          child: Text(
                            'Log in',
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, kRegisterScreen);
                          },
                          child: Text(
                            'Create an account',
                            style: GoogleFonts.rubik(
                              color: Colors.blueAccent,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
