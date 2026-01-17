/*

Auth repository contains the possible auth related operations for this application.

*/

import 'package:postly/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  );
  Future<AppUser?> getCurrentUserDetails();
  Future<String> resetPasswordEmail(String email);
  Future<void> logOut();
  Future<void> deleteAccount();
}
