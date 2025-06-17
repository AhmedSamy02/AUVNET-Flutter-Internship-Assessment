import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:nawel/features/auth/data/repositories/auth_repository.dart';
import 'package:nawel/features/auth/domain/use_cases/login_use_case.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_events.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase = LoginUseCase(
    repository: AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
    ),
  );
  AuthBloc() : super(const AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      final String email = event.email;
      final String password = event.password;
      emit(const LoginLoading());
      final loginResponse = await loginUseCase.call(email, password);
      loginResponse.fold(
        (failure) {
          emit(LoginFailure(error: failure.message));
        },
        (token) {
          emit(LoginSuccess(token: token));
        },
      );
    });
  }
}
