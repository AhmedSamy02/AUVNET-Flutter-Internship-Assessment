import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/assets.dart';

class CodeCard extends StatelessWidget {
  const CodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Card(
        elevation: 0.5.sp,
        child: Row(
          children: [
            SvgPicture.asset(
              kGotCodeSVG,
              width: 80.w,
              height: 80.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: SizedBox(
                width: 170.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Got a code!',
                      style: GoogleFonts.dmSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Add your code and save on your order',
                      style: GoogleFonts.dmSans(
                        fontSize: 10.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
