import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/use_cases/use_case.dart';
import 'package:nawel/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase extends UseCase<void> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call() => repository.logout();
}
