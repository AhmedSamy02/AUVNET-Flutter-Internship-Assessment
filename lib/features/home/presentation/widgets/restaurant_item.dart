import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/constants/assets.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.restaurant});
  final NearbyRestaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: restaurant.link == null
                  ? Image.asset(
                      kLogo,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                    )
                  : CachedNetworkImage(
                      imageUrl: restaurant.link!,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      progressIndicatorBuilder: (context, url, progress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Image.asset(
                          kLogo,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                        );
                      },
                    ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
            SizedBox(
              width: 100.w,
              child: Text(
                restaurant.name ?? 'Restaurant Name',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.01),
            Row(
              children: [
                Icon(Icons.access_time, size: 12.sp, color: Colors.grey[600]),
                SizedBox(width: 4.w),
                Text(
                  '${restaurant.timeInMins??30} mins',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
