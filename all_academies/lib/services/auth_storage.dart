import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static final _storage = FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    await _storage.write(key: "jwt_token", value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: "jwt_token");
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: "jwt_token");
  }
}
