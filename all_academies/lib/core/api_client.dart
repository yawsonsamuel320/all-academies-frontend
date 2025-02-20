import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Config.apiBaseUrl,
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    headers: {
      'Accept': 'application/json',
    },
  ));

  // ✅ Save token for future requests
  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("access_token", token);
  }

  // ✅ Retrieve token
  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("access_token");
  }

  // ✅ Attach auth headers automatically
  Future<Options> _authHeaders() async {
    String? token = await _getToken();
    return Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    );
  }

  // ✅ Login using OAuth2
  Future<Response> login(String username, String password) async {
    try {
      final formData = FormData.fromMap({
        'username': username,
        'password': password,
        'grant_type': 'password',
      });

      final response = await _dio.post(
        "/auth/login",
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      // Store token
      String token = response.data['access_token'];
      await _saveToken(token);

      return response;
    } catch (e) {
      print("🚨 Login Error: $e");
      rethrow;
    }
  }

  // ✅ Get Current User
  Future<Response> getCurrentUser() async {
    try {
      final response = await _dio.get(
        "/user/me",
        options: await _authHeaders(),
      );
      return response;
    } catch (e) {
      print("🚨 Error Fetching User: $e");
      rethrow;
    }
  }

  // ✅ Generic GET request
  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(
        endpoint,
        options: await _authHeaders(),
      );
      return response;
    } catch (e) {
      print("🚨 GET Request Error: $e");
      rethrow;
    }
  }

  // ✅ Generic POST request
  Future<Response> post(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        options: await _authHeaders(),
      );
      return response;
    } catch (e) {
      print("🚨 POST Request Error: $e");
      rethrow;
    }
  }

  // ✅ Generic PUT request
  Future<Response> put(String endpoint, dynamic data) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        options: await _authHeaders(),
      );
      return response;
    } catch (e) {
      print("🚨 PUT Request Error: $e");
      rethrow;
    }
  }

  // ✅ Generic PATCH request
  Future<Response> patch(String endpoint, dynamic data) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        options: await _authHeaders(),
      );
      return response;
    } catch (e) {
      print("🚨 PATCH Request Error: $e");
      rethrow;
    }
  }

  // ✅ Generic DELETE request
  Future<Response> delete(String endpoint) async {
    try {
      final response = await _dio.delete(
        endpoint,
        options: await _authHeaders(),
      );
      return response;
    } catch (e) {
      print("🚨 DELETE Request Error: $e");
      rethrow;
    }
  }
}
