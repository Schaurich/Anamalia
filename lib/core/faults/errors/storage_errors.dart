abstract class IStorageErrors implements Exception {
  String? message;
}

class GenericsStorageError implements IStorageErrors {
  GenericsStorageError({this.message});

  @override
  String? message;
}
