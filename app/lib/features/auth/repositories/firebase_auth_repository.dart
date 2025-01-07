import 'package:app/features/auth/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<User?> login(String email, String password) async {
    return await _authService.signIn(email, password);
  }

  Future<void> logout() async {
    return await _authService.signOut();
  }
}
