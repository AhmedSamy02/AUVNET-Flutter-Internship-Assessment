import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/assets.dart';
import 'package:nawel/core/constants/colors.dart';
import 'package:nawel/core/constants/screens.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_bloc.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_events.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_states.dart';
import 'package:nawel/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:quickalert/quickalert.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.loading,
              barrierDismissible: false);
        } else if (state is LoginSuccess) {
          Navigator.pop(context); // Close the loading dialog
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Login successful!',
              text: 'Welcome back!',
              barrierDismissible: false,
              onConfirmBtnTap: () {
                Navigator.pushReplacementNamed(context, kHomeScreen);
              },
              showCancelBtn: false,
              showConfirmBtn: true);
        } else if (state is LoginFailure) {
          Navigator.pop(context); // Close the loading dialog
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: state.error,
            title: 'Login failed',
            barrierDismissible: false,
            onConfirmBtnTap: () {
              Navigator.pop(context);
            },
            showCancelBtn: false,
            showConfirmBtn: true,
          );
        }
      },
      child: Scaffold(
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
                    key: formKey,
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
                          SizedBox(height: 18.h),
                          TextButton(
                            onPressed: () {
                              //* Sending login request
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthLoginRequested(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                              }
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
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, kRegisterScreen);
                            },
                            child: Text(
                              'Create an account',
                              style: GoogleFonts.dmSans(
                                color: Colors.blueAccent,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
