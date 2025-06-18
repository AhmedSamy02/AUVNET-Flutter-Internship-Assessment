import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
                        imageUrl:
              "https://via.assets.so/game.png?id=12&q=95&w=360&h=360&fit=fill",
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.05),
          SizedBox(
            width: 100.w,
            child: Text(
              'Restaurant Name',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.01),
          Row(
            children: [
              Icon(Icons.access_time, size: 12.sp, color: Colors.grey[600]),
              SizedBox(width: 4.w),
              Text(
                '30 mins',
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
    );
  }
}
