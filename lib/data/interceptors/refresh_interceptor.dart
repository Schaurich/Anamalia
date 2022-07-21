import 'package:dio/dio.dart';
import 'package:dowing_app/domain/stores/auth_store.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class IRefreshInterceptor {
  InterceptorsWrapper build();
}

@Injectable(as: IRefreshInterceptor)
class RefreshInterceptorImpl implements IRefreshInterceptor {
  final IAuthStore authStore = GetIt.instance.get<IAuthStore>();

  @override
  InterceptorsWrapper build() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final isAddRefreshToken = authStore.authModel?.accessToken != null;

        if (isAddRefreshToken) {
          options.headers.addAll(<String, dynamic>{
            'Authorization': 'Bearer ${authStore.authModel!.refreshToken}',
          });
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) async {
        return handler.next(error);
      },
    );
  }
}
