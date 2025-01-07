import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Sign In User
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Save refresh token securely
      await _secureStorage.write(
        key: 'refresh_token',
        value:res.user!.refreshToken!,
      );
      return res.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // Check if user is signed in
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  // Sign Out User
  Future<void> signOut() async {
    await _auth.signOut();
    await _secureStorage.delete(key: 'refresh_token');
  }
}
