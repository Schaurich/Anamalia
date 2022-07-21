import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:dowing_app/data/interceptors/base_interceptor.dart';
import 'package:injectable/injectable.dart';

abstract class INetWork {
  Future<Response<T>> get<T>(String path);
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });
  Future<void> retry(RequestOptions requestOptions);

  INetWork configureInterceptorAndGetInstance(IBaseInterceptor baseInterceptor);
}

@Singleton(as: INetWork)
class NetWorkImpl implements INetWork {
  NetWorkImpl() {
    _dio = Dio();
  }

  late Dio _dio;

  @override
  INetWork configureInterceptorAndGetInstance(
    IBaseInterceptor baseInterceptor,
  ) {
    _dio.interceptors
      ..add(dioLoggerInterceptor)
      ..add(baseInterceptor.build());

    return this;
  }

  @override
  Future<Response<T>> get<T>(String path) async {
    return _dio.get(path);
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int p1, int p2)? onSendProgress,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int p1, int p2)? onSendProgress,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
