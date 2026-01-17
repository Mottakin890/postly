/*

this is the file where the bloc state implemented for auth states

*/

import 'package:postly/features/auth/domain/entities/app_user.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthenticatedState extends AuthStates {
  final AppUser user;
  AuthenticatedState(this.user);
}

class UnauthenticatedState extends AuthStates {}

class AuthErrorState extends AuthStates {
  final String errorMsg;
  AuthErrorState(this.errorMsg);
}
