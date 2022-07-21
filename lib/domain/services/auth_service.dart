import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dowing_app/core/faults/errors/http_errors.dart';
import 'package:dowing_app/core/faults/errors/storage_errors.dart';
import 'package:dowing_app/data/repositories/auth_repository.dart';
import 'package:dowing_app/domain/models/auth_model.dart';
import 'package:dowing_app/domain/stores/auth_store.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthServices {
  Future<Either<IHttpErrors, AuthModel>> authenticate(
    String email,
    String password,
  );
  Future<Either<IStorageErrors, AuthModel>> getAuthFromStorage(String key);
  Future<Either<IHttpErrors, bool>> requestChangePassword(String email);
  Future<Either<IHttpErrors, bool>> emailConfirm(String email, String pincode);
  Future<Either<IHttpErrors, AuthModel>> refreshToken(String email);
  Future<void> logout();
}

@Injectable(as: IAuthServices)
class AuthServicesImpl implements IAuthServices {
  AuthServicesImpl(
    this.authRepository,
    this.authStore,
  );

  final IAuthRepository authRepository;
  final IAuthStore authStore;

  @override
  Future<Either<IHttpErrors, AuthModel>> authenticate(
    String email,
    String password,
  ) async {
    final response = await authRepository.authenticate(email, password);

    return response.fold(
      (error) {
        log(error.toString());
        return Left(error);
      },
      (data) async {
        await authRepository.saveAuthOnStorage(data);
        authStore.authModel = data;
        return Right(data);
      },
    );
  }

  @override
  Future<Either<IStorageErrors, AuthModel>> getAuthFromStorage(
    String key,
  ) async {
    final response = await authRepository.getAuthFromStorage(key);

    return response.fold(
      (error) {
        log(error.toString());
        return Left(error);
      },
      (data) {
        authStore.authModel = data;
        return Right(data);
      },
    );
  }

  @override
  Future<Either<IHttpErrors, bool>> requestChangePassword(String email) async {
    final response = await authRepository.requestChangePassword(email);

    return response;
  }

  @override
  Future<Either<IHttpErrors, bool>> emailConfirm(
    String email,
    String pincode,
  ) async {
    final response = await authRepository.emailConfirm(email, pincode);

    return response;
  }

  @override
  Future<Either<IHttpErrors, AuthModel>> refreshToken(String email) async {
    final response = await authRepository.refreshToken(email);

    return response.fold(
      (error) {
        log(error.toString());
        return Left(error);
      },
      (data) {
        authRepository.saveAuthOnStorage(data);
        authStore.authModel = data;

        return Right(data);
      },
    );
  }

  @override
  Future<void> logout() async {
    await authRepository.logout();
  }
}
