import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/features/home/presentation/widgets/restaurant_item.dart';

class NearbyRestaurantsWidget extends StatelessWidget {
  const NearbyRestaurantsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.sp, top: 30.sp),
          child: Text(
            'Popular restaurants nearby',
            textAlign: TextAlign.start,
            style: GoogleFonts.dmSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 300.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemBuilder: (context, index) {
                return RestaurantItem();
              }),
        ),
      ],
    );
  }
}
