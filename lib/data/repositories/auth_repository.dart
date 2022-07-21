import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dowing_app/core/config/env.dart';
import 'package:dowing_app/core/faults/errors/http_errors.dart';
import 'package:dowing_app/core/faults/errors/storage_errors.dart';
import 'package:dowing_app/core/shared/constants/storage_constants.dart';
import 'package:dowing_app/data/gateways/http/network.dart';
import 'package:dowing_app/data/gateways/storage/data_base.dart';
import 'package:dowing_app/data/interceptors/refresh_interceptor.dart';
import 'package:dowing_app/data/serializers/auth_model_serializer.dart';
import 'package:dowing_app/domain/models/auth_model.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthRepository {
  Future<Either<IHttpErrors, AuthModel>> authenticate(
    String email,
    String password,
  );
  Future<void> saveAuthOnStorage(AuthModel authModel);
  Future<void> logout();
  Future<Either<IStorageErrors, AuthModel>> getAuthFromStorage(String key);
  Future<Either<IHttpErrors, bool>> requestChangePassword(String email);
  Future<Either<IHttpErrors, bool>> emailConfirm(String email, String pincode);
  Future<Either<IHttpErrors, AuthModel>> refreshToken(String email);
}

@Injectable(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({
    required this.http,
    required this.dataBase,
  });

  final INetWork http;
  final IDataBase dataBase;

  @override
  Future<Either<IHttpErrors, AuthModel>> authenticate(
    String email,
    String password,
  ) async {
    try {
      final response = await http.post<Map<String, dynamic>>(
        '${envMetadata().apiUrl}/v1.2/User/authenticate',
        data: {
          'email': email,
          'password': password,
        },
      );

      return Right(AuthModelSerializer.fromJson(response.data!));
    } on Exception catch (e) {
      log(e.toString());
      return Left(GenericsHttpError(message: e.toString()));
    }
  }

  @override
  Future<void> saveAuthOnStorage(AuthModel authModel) async {
    await dataBase.write(
      StorageConstans.auth,
      AuthModelSerializer.of(authModel).toJson(),
    );
  }

  @override
  Future<Either<IStorageErrors, AuthModel>> getAuthFromStorage(
    String key,
  ) async {
    try {
      final dataRaw = await dataBase.read(StorageConstans.auth);

      return Right(AuthModelSerializer.fromJson(dataRaw));
    } on Exception catch (e) {
      log(e.toString());
      return Left(GenericsStorageError(message: e.toString()));
    }
  }

  @override
  Future<Either<IHttpErrors, bool>> requestChangePassword(String email) async {
    try {
      final response = await http.post<Map<String, dynamic>>(
        '${envMetadata().apiUrl}/v1.2/User/request-change-password/$email',
      );

      return Right(response.data!['value'] as bool);
    } on Exception catch (e) {
      log(e.toString());
      return Left(GenericsHttpError(message: e.toString()));
    }
  }

  @override
  Future<Either<IHttpErrors, bool>> emailConfirm(
    String email,
    String pincode,
  ) async {
    try {
      final response = await http.post<Map<String, dynamic>>(
        '${envMetadata().apiUrl}/v1.2/User/confirm-email/',
        data: {
          'email': email,
          'confirmationCode': pincode,
        },
      );
      return Right(response.data!['value'] as bool);
    } on Exception catch (e) {
      log(e.toString());
      return Left(GenericsHttpError(message: e.toString()));
    }
  }

  @override
  Future<Either<IHttpErrors, AuthModel>> refreshToken(String email) async {
    final dio = Dio()..interceptors.add(RefreshInterceptorImpl().build());
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${envMetadata().apiUrl}/v1.2/User/refresh-token?email=$email',
      );
      return Right(response.data!['value'] as AuthModel);
    } on Exception catch (e) {
      log(e.toString());
      return Left(GenericsHttpError(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await Future.wait([
      dataBase.delete(StorageConstans.auth),
      dataBase.delete(StorageConstans.user)
    ]);
  }
}
