/*

This is the file where firebase related operation will be done for this application backend.
For using clean architecture wee can swap the backend any time.

*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:postly/features/auth/domain/entities/app_user.dart';
import 'package:postly/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo extends AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;

      if (user == null) throw Exception('No user loggged in!');

      await user.delete();

      await logOut();
    } catch (e) {
      throw Exception('Account Delete failed: $e');
    }
  }

  @override
  Future<AppUser?> getCurrentUserDetails() async {
    try {
      final user = _auth.currentUser;

      if (user == null) return null;

      return AppUser(uid: user.uid, email: user.email!);
    } catch (e) {
      throw Exception('Getting User details failed: $e');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      final user = _auth.currentUser;

      if (user == null) throw Exception('Logout failed!');

      await _auth.signOut();
    } catch (e) {
      throw Exception('Logout failed : $e');
    }
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);

      return user;
    } catch (e) {
      throw Exception('Login Error: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);
      return user;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  @override
  Future<String> resetPasswordEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Password reset email sent succesfully, check your mail box please.';
    } catch (e) {
      throw Exception('Reset password failed: $e');
    }
  }
}
