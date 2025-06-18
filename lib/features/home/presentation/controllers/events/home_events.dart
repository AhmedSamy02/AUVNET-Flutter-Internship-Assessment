sealed class HomeEvent {
  const HomeEvent();
}
class HomeOffersRequested extends HomeEvent {
  const HomeOffersRequested();
}
class HomeNearbyRestaurantsRequested extends HomeEvent {
  const HomeNearbyRestaurantsRequested();
}