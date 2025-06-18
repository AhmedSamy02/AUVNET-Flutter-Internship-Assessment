import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/use_cases/use_case.dart';
import 'package:nawel/features/home/data/models/offer_model.dart';
import 'package:nawel/features/home/domain/repositories/home_repository.dart';

class RequestOffersUseCase extends UseCase<List<OfferModel>> {
  final HomeRepository repository;

  RequestOffersUseCase({required this.repository});
  @override
  Future<Either<Failure, List<OfferModel>>> call() =>repository.getOffers();
}
