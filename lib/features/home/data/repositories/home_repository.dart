import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/errors/firebase_failure.dart';
import 'package:nawel/core/errors/unexpected_failure.dart';
import 'package:nawel/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';
import 'package:nawel/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<NearbyRestaurant>>> getNearbyRestaurants() async {
    try {
      final restaurants = await remoteDataSource.getNearbyRestaurants();
      return Right(restaurants);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getOffers() async {
    try {
      final offers = await remoteDataSource.getOffers();
      return Right(offers);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
