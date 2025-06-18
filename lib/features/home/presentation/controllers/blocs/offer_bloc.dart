import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:nawel/features/home/data/repositories/home_repository.dart';
import 'package:nawel/features/home/domain/use_cases/request_offers_use_case.dart';
import 'package:nawel/features/home/presentation/controllers/events/home_events.dart';
import 'package:nawel/features/home/presentation/controllers/states/home_states.dart';

class OfferBloc extends Bloc<HomeEvent, HomeState> {
  final RequestOffersUseCase requestOffersUseCase = RequestOffersUseCase(
    repository: HomeRepositoryImpl(
      remoteDataSource: HomeRemoteDataSourceImpl(),
    ),
  );
  OfferBloc() : super(const OfferInitial()) {
    on<HomeOffersRequested>((event, emit) async {
      emit(const HomeOffersLoading());
      try {
        final response = await requestOffersUseCase.call();
        response.fold(
          (failure) {
            emit(HomeOffersFailure(error: failure.message));
          },
          (offers) {
            emit(HomeOffersSuccess(offers: offers));
          },
        );
      } catch (error) {
        emit(HomeOffersFailure(error: error.toString()));
      }
    });
  }
}