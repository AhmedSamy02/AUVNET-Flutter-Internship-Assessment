import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/failure.dart';
import 'package:nawel/core/use_cases/use_case_with_params.dart';
import 'package:nawel/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCaseWithTwoParams<void, String, String> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(email, password) =>
      repository.login(email, password);
}
