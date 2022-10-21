import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///Armazena informações confidenciais de forma segura
class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static Future<String?> read(String key) async {
    if (!await _storage.containsKey(key: key)) {
      return null;
    }

    return await _storage.read(key: key);
  }

  static Future<void> save(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    if (await _storage.containsKey(key: key)) {
      await _storage.delete(key: key);
    }
  }

  static Future<bool> hasKey(String key) async {
    return await _storage.containsKey(key: key);
  }
}
