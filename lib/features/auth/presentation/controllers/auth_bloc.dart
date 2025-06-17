import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nawel/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:nawel/features/auth/data/repositories/auth_repository.dart';
import 'package:nawel/features/auth/domain/use_cases/login_use_case.dart';
import 'package:nawel/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:nawel/features/auth/domain/use_cases/register_use_case.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_events.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase = LoginUseCase(
    repository: AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
    ),
  );
  RegisterUseCase registerUseCase = RegisterUseCase(
    repository: AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
    ),
  );
  LogoutUseCase logoutUseCase = LogoutUseCase(
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
          GetIt.I
              .get<FlutterSecureStorage>()
              .write(key: 'token', value: token);
          emit(LoginSuccess());
        },
      );
    });
    on<AuthRegisterRequested>((event, emit) async {
      final String email = event.email;
      final String password = event.password;
      emit(const RegisterLoading());
      final response = await registerUseCase.call(email, password);
      response.fold(
        (failure) {
          emit(RegisterFailure(error: failure.message));
        },
        (token) {
          emit(const RegisterSuccess());
        },
      );
    });
    on<AuthLogoutRequested>((event, emit) async {
      emit(const LogoutLoading());
      final response = await logoutUseCase.call();
      response.fold(
        (failure) {
          emit(LogoutFailure(error: failure.message));
        },
        (_) {
          GetIt.I.get<FlutterSecureStorage>().delete(key: 'token');
          emit(const LogoutSuccess());
        },
      );
    });
  }
}
