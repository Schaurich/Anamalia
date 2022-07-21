import 'package:dowing_app/domain/models/auth_model.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthStore {
  late AuthModel? authModel;

  String? get accessTokenExpiration;

  String? get refreshTokenExpiration;
}

@Singleton(as: IAuthStore)
class AuthStoreImpl implements IAuthStore {
  @override
  AuthModel? authModel;

  @override
  String? get accessTokenExpiration => authModel?.accessTokenExpiration;

  @override
  String? get refreshTokenExpiration => authModel?.refreshTokenExpiration;
}
