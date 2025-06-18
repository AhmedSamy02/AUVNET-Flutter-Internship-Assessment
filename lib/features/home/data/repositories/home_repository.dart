import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nawel/core/constants/methods.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/errors/firebase_failure.dart';
import 'package:nawel/core/errors/unexpected_failure.dart';
import 'package:nawel/features/home/data/data_sources/home_local_data_source.dart';
import 'package:nawel/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:nawel/features/home/data/models/nearby_restaurant.dart';
import 'package:nawel/features/home/data/models/offer_model.dart';
import 'package:nawel/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<NearbyRestaurant>>> getNearbyRestaurants() async {
    try {
      final restaurants = await remoteDataSource.getNearbyRestaurants();
      saveToNearbyRestaurants(restaurants);
      return Right(restaurants);
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed' || !(await isConnected())) {
        final restaurants = await localDataSource.getNearbyRestaurants();
        if (restaurants.isNotEmpty) {
          return Right(restaurants);
        }
      }
      return Left(FirebaseFailure(message: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferModel>>> getOffers() async {
    try {
      final offers = await remoteDataSource.getOffers();
      saveToOffers(offers);
      return Right(offers);
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed' || !(await isConnected())) {
        final offers = await localDataSource.getOffers();
        if (offers.isNotEmpty) {
          return Right(offers);
        }
      }
      return Left(FirebaseFailure(message: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
