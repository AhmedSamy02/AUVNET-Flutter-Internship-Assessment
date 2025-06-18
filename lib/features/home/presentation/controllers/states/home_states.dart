import 'package:nawel/features/home/data/models/nearby_restaurant.dart';

sealed class HomeState {
  const HomeState();
}
class OfferInitial extends HomeState {
  const OfferInitial();
}
class NearbyRestaurantsInitial extends HomeState {
  const NearbyRestaurantsInitial();
}
class HomeInitial extends HomeState {
  const HomeInitial();
}
class HomeOffersLoading extends HomeState {
  const HomeOffersLoading();
}
class HomeOffersSuccess extends HomeState {
  final List<String> offers; // Replace with actual offer model
  const HomeOffersSuccess({required this.offers});
}
class HomeOffersFailure extends HomeState {
  final String error;
  const HomeOffersFailure({required this.error});
}
class HomeNearbyRestaurantsLoading extends HomeState {
  const HomeNearbyRestaurantsLoading();
}
class HomeNearbyRestaurantsSuccess extends HomeState {
  final List<NearbyRestaurant> restaurants; // Replace with actual restaurant model
  const HomeNearbyRestaurantsSuccess({required this.restaurants});
}
class HomeNearbyRestaurantsFailure extends HomeState {
  final String error;
  const HomeNearbyRestaurantsFailure({required this.error});
}
