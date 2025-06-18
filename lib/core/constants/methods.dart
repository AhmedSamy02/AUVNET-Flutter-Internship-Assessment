import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nawel/core/constants/values.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';
import 'package:nawel/features/home/data/models/offer_model.dart';

void saveToOffers(List<OfferModel> offers) {
  var box = Hive.box<OfferModel>(kOffersBox);
  box.clear();
  offers.forEach((offer) {
    box.add(offer);
  });
}

void saveToNearbyRestaurants(List<NearbyRestaurant> restaurants) {
  var box = Hive.box<NearbyRestaurant>(kNearbyRestaurantsBox);
  box.clear();
  restaurants.forEach((restaurant) {
    box.add(restaurant);
  });
}
Future<bool> isConnected() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<NearbyRestaurant>(NearbyRestaurantAdapter());
  Hive.registerAdapter<OfferModel>(OfferModelAdapter());
  await Hive.openBox<OfferModel>(kOffersBox);
  await Hive.openBox<NearbyRestaurant>(kNearbyRestaurantsBox);
}
