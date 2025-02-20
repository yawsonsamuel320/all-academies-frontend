import '../../../core/api_client.dart';

class AuthRepository {
  final ApiClient apiClient = ApiClient();

  Future<String?> login(String username, String password) async {
    try {
      final response = await apiClient.login(username, password);

      if (response.statusCode == 200) {
        final userResponse = await apiClient.getCurrentUser();
      }

      return response.data['access_token'];
    } catch (e) {
      print('Login error $e');
    }
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      final response = await apiClient.getCurrentUser();

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print('Get current user error: $e');
    }
    return null;
  }

  Future<String?> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String userType,
    String? educationalInstitution,
    String? avatar,
  }) async {
    try {
      final response = await apiClient.post("/user/signup", {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password, // Required in UserCreate schema
        "user_type": userType, // Ensure userType is a valid enum string
        "educational_institution": educationalInstitution,
        "avatar": avatar,
      });

      if (response.statusCode == 201) {
        return response.data["access_token"];
      }
    } catch (e) {
      print("Signup error: $e");
    }
    return null;
  }
}
