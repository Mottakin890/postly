import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postly/core/widgets/toast.dart';
import 'package:postly/features/auth/presentation/cubits/auth_cubits.dart';

class AuthVm {
  void register(
    String name,
    String email,
    String password,
    BuildContext context,
  ) {
    final authCubit = context.read<AuthCubits>();

    if (email.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
      authCubit.register(name, email, password);
    } else {
      showToast("Please fill up the form.");
    }
  }

  void login(String email, String password, BuildContext context) {
    final authCubit = context.read<AuthCubits>();

    if (email.isNotEmpty && password.isNotEmpty) {
      authCubit.login(email, password);
    } else {
      showToast('Please enter the detaild correctly!');
    }
  }

  void logout(BuildContext context) {
    final authCubit = context.read<AuthCubits>();

    authCubit.logout();
  }
}
