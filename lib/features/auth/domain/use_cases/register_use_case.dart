import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/use_cases/use_case_with_params.dart';
import 'package:nawel/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase extends UseCaseWithTwoParams<void, String, String> {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String email, String password) async {
    return await repository.register(email, password);
  }
}
