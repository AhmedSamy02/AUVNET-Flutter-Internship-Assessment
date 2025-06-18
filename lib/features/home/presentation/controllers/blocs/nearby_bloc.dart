import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/home/data/data_sources/home_local_data_source.dart';
import 'package:nawel/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:nawel/features/home/data/repositories/home_repository.dart';
import 'package:nawel/features/home/domain/use_cases/request_nearby_restaurants_use_case.dart';
import 'package:nawel/features/home/presentation/controllers/events/home_events.dart';
import 'package:nawel/features/home/presentation/controllers/states/home_states.dart';

class NearbyBloc extends Bloc<HomeEvent, HomeState> {
  
  final RequestNearbyRestaurantsUseCase requestNearbyRestaurantsUseCase =
      RequestNearbyRestaurantsUseCase(
    repository: HomeRepositoryImpl(
      localDataSource: HomeLocalDataSourceImpl(),
      remoteDataSource: HomeRemoteDataSourceImpl(),
    ),
  );
  NearbyBloc() : super(const NearbyRestaurantsInitial()) {
    on<HomeNearbyRestaurantsRequested>((event, emit) async {
      emit(const HomeNearbyRestaurantsLoading());
      try {
        final response = await requestNearbyRestaurantsUseCase.call();
        response.fold(
          (failure) {
            emit(HomeNearbyRestaurantsFailure(error: failure.message));
          },
          (restaurants) {
            emit(HomeNearbyRestaurantsSuccess(restaurants: restaurants));
          },
        );
      } catch (error) {
        emit(HomeNearbyRestaurantsFailure(error: error.toString()));
      }
    });
    
  }
}
