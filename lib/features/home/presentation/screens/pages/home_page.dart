import 'package:flutter/material.dart';
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
          HomePageAppBar(),
          ServicesWidget(),
          ShortcutWidget(),
          OffersSwiper(
            images: [
              "https://via.assets.so/game.png?id=0&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=1&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=2&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=3&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=4&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=5&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=6&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=7&q=95&w=360&h=360&fit=fill",
              "https://via.assets.so/game.png?id=8&q=95&w=360&h=360&fit=fill",
            ],
          ),
          NearbyRestaurantsWidget()
        ],
      ),
    );
  }
}
