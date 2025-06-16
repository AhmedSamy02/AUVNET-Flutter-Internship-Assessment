import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/use_cases/use_case_with_params.dart';
import 'package:nawel/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase
    extends UseCaseWithThreeParams<void, String, String, String> {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(
          String name, String email, String password) =>
      repository.register(name, email, password);
}
