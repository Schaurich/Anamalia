import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class IDataBase {
  IDataBase configureDataBaseAndGetInstance();

  Future<void> write(String key, Map<String, dynamic> value);
  Future<void> delete(String key);
  Future<bool> contains(String key);
  Future<Map<String, dynamic>> read(String key);
}

@Singleton(as: IDataBase)
class DataBaseImpl implements IDataBase {
  late final FlutterSecureStorage _storage;

  @override
  IDataBase configureDataBaseAndGetInstance() {
    _storage = const FlutterSecureStorage();

    return this;
  }

  @override
  Future<void> write(String key, Map<String, dynamic> value) => _storage.write(key: key, value: json.encode(value));

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<Map<String, dynamic>> read(String key) async {
    final dataRaw = await _storage.read(key: key) ?? '{}';
    return json.decode(dataRaw) as Map<String, dynamic>;
  }
  
  @override
  Future<bool> contains(String key) => _storage.containsKey(key: key);
}
