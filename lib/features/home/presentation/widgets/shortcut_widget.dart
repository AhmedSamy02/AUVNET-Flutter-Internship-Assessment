import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/assets.dart';
import 'package:nawel/features/home/presentation/widgets/shortcut_item.dart';

class ShortcutWidget extends StatelessWidget {
  const ShortcutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.sp, top: 30.sp),
          child: Text(
            'Shortcuts:',
            textAlign: TextAlign.start,
            style: GoogleFonts.dmSans(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Wrap(
          runSpacing: 16.h,
          spacing: 3.w,
          children: [
            Expanded(
              child: ShortcutItem(
                icon: kPastOrderSVG,
                title: 'Past Orders',
              ),
            ),
            Expanded(
              child: ShortcutItem(
                icon: kSuperSaverSVG,
                title: 'Super Saver',
              ),
            ),
            Expanded(
              child: ShortcutItem(
                icon: kMustTriesSVG,
                title: 'Must-tries',
              ),
            ),
            Expanded(
              child: ShortcutItem(
                icon: kGiveBackSVG,
                title: 'Give Back',
              ),
            ),
            Expanded(
              child: ShortcutItem(
                icon: kStarSVG,
                title: 'Best Sellers',
              ),
            ),
          ],
        )
      ],
    );
  }
}
