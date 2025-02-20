import 'package:all_academies/features/auth/data/auth_repository.dart';
import 'package:all_academies/features/auth/data/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a state provider to hold user data
final userProvider = StateNotifierProvider<UserNotifier, AsyncValue<Map<String, dynamic>?>>((ref) {
  final authRepo = ref.read(authRepositoryProvider);
  return UserNotifier(authRepo);
});

// UserNotifier class
class UserNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  final AuthRepository authRepository;

  UserNotifier(this.authRepository) : super(const AsyncValue.loading()) {
    fetchUser(); // Fetch user when initialized
  }

  Future<void> fetchUser() async {
    try {
      state = const AsyncValue.loading();
      final userData = await authRepository.getCurrentUser();
      state = AsyncValue.data(userData);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Add a method to update the state after profile edits
  void updateUser(Map<String, dynamic> updatedUser) {
    state = AsyncValue.data(updatedUser);
  }
}