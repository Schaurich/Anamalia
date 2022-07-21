import 'package:dio/dio.dart';
import 'package:dowing_app/core/config/routes/app_router.gr.dart';
import 'package:dowing_app/core/helpers/token_helper.dart';
import 'package:dowing_app/data/gateways/http/network.dart';
import 'package:dowing_app/domain/services/auth_service.dart';
import 'package:dowing_app/domain/stores/auth_store.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class IBaseInterceptor {
  InterceptorsWrapper build();
}

@Injectable(as: IBaseInterceptor)
class BaseInterceptorImpl implements IBaseInterceptor {
  final IAuthServices authServices = GetIt.instance.get<IAuthServices>();
  final IAuthStore authStore = GetIt.instance.get<IAuthStore>();
  final INetWork netWork = GetIt.instance.get<INetWork>();

  String lastErrorUrl = '';

  @override
  InterceptorsWrapper build() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final isAddAuthorization = authStore.authModel?.accessToken != null;

        if (isAddAuthorization) {
          options.headers.addAll(<String, dynamic>{
            'Authorization': 'Bearer ${authStore.authModel!.accessToken}',
          });
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) async {
        final isRefreshTokenFlow = error.response?.statusCode == 403 ||
            error.response?.statusCode == 401;

        if (isRefreshTokenFlow) {
          if (TokenHelper.isActive(authStore.accessTokenExpiration!)) {
            return handler.next(error);
          }

          if (TokenHelper.isActive(authStore.refreshTokenExpiration!)) {
            await authServices.refreshToken(authStore.authModel!.email!);
            return netWork.retry(error.requestOptions);
          } else {
            await authServices.logout();
            await GetIt.instance.get<AppRouter>().popAndPush(LoginPageRoute());
            handler.reject(error);
          }
        }

        return handler.next(error);
      },
    );
  }
}
