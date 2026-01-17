import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postly/core/app_assets/app_assets.dart';
import 'package:postly/features/auth/presentation/vm/auth_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authVm = AuthVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => _authVm.logout(context),
          child: SvgPicture.asset(AppAssets.trash),
        ),
      ),
    );
  }
}
