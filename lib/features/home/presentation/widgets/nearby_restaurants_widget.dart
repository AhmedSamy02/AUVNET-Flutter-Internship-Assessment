import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/features/home/presentation/controllers/blocs/nearby_bloc.dart';
import 'package:nawel/features/home/presentation/controllers/events/home_events.dart';
import 'package:nawel/features/home/presentation/controllers/states/home_states.dart';
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
          height: MediaQuery.of(context).size.width * 0.5,
          child: BlocBuilder<NearbyBloc, HomeState>(
            bloc: BlocProvider.of<NearbyBloc>(context)
              ..add(const HomeNearbyRestaurantsRequested()),
            builder: (context, state) {
              if (state is HomeNearbyRestaurantsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeNearbyRestaurantsFailure) {
                return Center(child: Text(state.error));
              } else if (state is HomeNearbyRestaurantsSuccess) {
                if (state.restaurants.isEmpty) {
                  return const Center(
                      child: Text('No nearby restaurants found.'));
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    itemCount: state.restaurants.length,
                    itemBuilder: (context, index) {
                      return RestaurantItem(
                        restaurant: state.restaurants[index],
                      );
                    },
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
