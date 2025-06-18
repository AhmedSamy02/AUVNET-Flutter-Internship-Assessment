import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/constants/colors.dart';

class OffersSwiper extends StatefulWidget {
  const OffersSwiper({super.key, required this.images});
  final List<String> images;
  @override
  State<OffersSwiper> createState() => _OffersSwiperState();
}

class _OffersSwiperState extends State<OffersSwiper> {
  final SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.6,
            child: Swiper(
              controller: _controller,
              onIndexChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          widget.images[index % widget.images.length],
                      progressIndicatorBuilder: (context, url, progress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              itemCount: widget.images.length,
              loop: true,
              scale: 0.7,
              autoplay: true,
              autoplayDelay: 5000,
              duration: 1000,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (index) {
              bool isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: isActive ? 10.w : 8.w,
                height: isActive ? 10.w : 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? kPrimaryColor : Colors.grey[350],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
