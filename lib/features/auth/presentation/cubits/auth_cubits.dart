/*

This file this responsible for auth state management.

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postly/features/auth/domain/entities/app_user.dart';
import 'package:postly/features/auth/domain/repos/auth_repo.dart';
import 'package:postly/features/auth/presentation/cubits/auth_states.dart';

class AuthCubits extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubits({required this.authRepo}) : super(AuthInitialState());

  AppUser? get currentUser => _currentUser;

  void checkAuth() async {
    emit(AuthLoadingState());
    final AppUser? user = await authRepo.getCurrentUserDetails();
    if (user != null) {
      emit(AuthenticatedState(user));
    } else {
      emit(UnauthenticatedState());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      final user = await authRepo.loginWithEmailPassword(email, password);

      if (user != null) {
        _currentUser = user;
        emit(AuthenticatedState(user));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnauthenticatedState());
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      emit(AuthLoadingState());
      final user = await authRepo.registerWithEmailPassword(
        name,
        email,
        password,
      );
      if (user != null) {
        _currentUser = user;
        emit(AuthenticatedState(user));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnauthenticatedState());
    }
  }

  Future<void> logout() async {
    emit(AuthLoadingState());
    await authRepo.logOut();
    emit(UnauthenticatedState());
  }

  Future<String> forgotPassword(String email) async {
    try {
      final message = await authRepo.resetPasswordEmail(email);
      return message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(AuthLoadingState());
      await authRepo.deleteAccount();
      emit(UnauthenticatedState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnauthenticatedState());
    }
  }
}
