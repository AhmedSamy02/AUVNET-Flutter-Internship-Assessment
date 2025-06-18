import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/assets.dart';
import 'package:nawel/core/constants/colors.dart';
import 'package:nawel/core/constants/screens.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({
    super.key,
    required this.title,
    required this.description,
    this.controller,
    this.lastPage,
  });
  final String title;
  final String description;
  final PageController? controller;
  final int? lastPage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -70.h,
          left: -130.w,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [kPrimaryColor, kSecondaryColor],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -MediaQuery.of(context).size.height * 0.05,
          right: -MediaQuery.of(context).size.width * 0.1,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width * 0.52,
              height: MediaQuery.of(context).size.width * 0.52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBlurredCircleColor.withAlpha(76),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Image.asset(
                  width: 310.w,
                  height: 310.h,
                  kLogo,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.rubik(
                          fontSize: 28.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Text(description,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kSecondaryTextColor,
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
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
                          MediaQuery.of(context).size.width * 0.7,
                          45.h,
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    TextButton(
                      onPressed: () {
                        if (controller != null) {
                          if (controller!.page != lastPage) {
                            controller!.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacementNamed(
                                context, kLoginScreen);
                          }
                        }
                      },
                      child: Text(
                        'next',
                        style: GoogleFonts.rubik(
                          color: kSecondaryTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
