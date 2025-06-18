import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/use_cases/use_case.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';
import 'package:nawel/features/home/domain/repositories/home_repository.dart';

class RequestNearbyRestaurantsUseCase extends UseCase<List<NearbyRestaurant>> {
  final HomeRepository repository;
  RequestNearbyRestaurantsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NearbyRestaurant>>> call() =>
      repository.getNearbyRestaurants();
}
