import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_repository.dart';  // Import your AuthRepository

// Define a provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
