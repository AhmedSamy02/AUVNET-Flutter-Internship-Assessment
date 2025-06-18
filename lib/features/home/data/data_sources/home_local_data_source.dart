import 'package:hive/hive.dart';
import 'package:nawel/core/constants/values.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';
import 'package:nawel/features/home/data/models/offer_model.dart';

abstract class HomeLocalDataSource {
  Future<List<OfferModel>> getOffers();
  Future<List<NearbyRestaurant>> getNearbyRestaurants();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<OfferModel>> getOffers() async {
    final data = Hive.box<OfferModel>(kOffersBox).values;
    if (data.isEmpty) {
      return [];
    }
    return data.toList();
  }

  @override
  Future<List<NearbyRestaurant>> getNearbyRestaurants() async {
    final data = Hive.box<NearbyRestaurant>(kNearbyRestaurantsBox).values;
    if (data.isEmpty) {
      return [];
    }
    return data.toList();
  }
}
