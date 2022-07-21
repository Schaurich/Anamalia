abstract class IHttpErrors implements Exception {
  String? message;
}

class GenericsHttpError implements IHttpErrors {
  GenericsHttpError({this.message});

  @override
  String? message;
}
