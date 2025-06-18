import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<NearbyRestaurant>>> getNearbyRestaurants();
  Future<Either<Failure,List<String>>> getOffers();
}
