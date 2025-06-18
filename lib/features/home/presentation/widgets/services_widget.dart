import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/assets.dart';
import 'package:nawel/features/home/presentation/widgets/code_card.dart';
import 'package:nawel/features/home/presentation/widgets/services_item.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.sp, top: 3.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services:',
            textAlign: TextAlign.start,
            style: GoogleFonts.dmSans(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10.h),
          const IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ServicesItem(
                    image: kFoodImage,
                    title: 'Food',
                    description: 'Up to 50%',
                  ),
                ),
                Expanded(
                  child: ServicesItem(
                    image: kHealthImage,
                    title: 'Health & Wellness',
                    description: '20 mins',
                  ),
                ),
                Expanded(
                  child: ServicesItem(
                    image: kGroceryImage,
                    title: 'Groceries',
                    description: '15 mins',
                  ),
                ),
              ],
            ),
          ),
          const CodeCard(),
        ],
      ),
    );
  }
}
