import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/home/presentation/controllers/blocs/offer_bloc.dart';
import 'package:nawel/features/home/presentation/controllers/events/home_events.dart';
import 'package:nawel/features/home/presentation/controllers/states/home_states.dart';
import 'package:nawel/features/home/presentation/widgets/home_page_app_bar.dart';
import 'package:nawel/features/home/presentation/widgets/nearby_restaurants_widget.dart';
import 'package:nawel/features/home/presentation/widgets/offers_swiper.dart';
import 'package:nawel/features/home/presentation/widgets/services_widget.dart';
import 'package:nawel/features/home/presentation/widgets/shortcut_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomePageAppBar(),
          const ServicesWidget(),
          const ShortcutWidget(),
          BlocBuilder<OfferBloc, HomeState>(
            bloc: BlocProvider.of<OfferBloc>(context)
              ..add(const HomeOffersRequested()),
            builder: (context, state) {
              if (state is HomeOffersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeOffersFailure) {
                return Center(child: Text(state.error));
              } else if (state is HomeOffersSuccess) {
                return OffersSwiper(images: state.offers);
              }
              return const SizedBox.shrink();
            },
          ),
          const NearbyRestaurantsWidget()
        ],
      ),
    );
  }
}
