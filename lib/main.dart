import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postly/core/themes/app_colors.dart';
import 'package:postly/core/themes/app_themes.dart';
import 'package:postly/core/widgets/toast.dart';
import 'package:postly/features/auth/data/firebase_auth_repo.dart';
import 'package:postly/features/auth/presentation/cubits/auth_states.dart';
import 'package:postly/features/auth/presentation/pages/login_page.dart';
import 'package:postly/features/home/presentation/pages/home_page.dart';
import 'package:postly/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postly/features/auth/presentation/cubits/auth_cubits.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: .dark,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Postly(),
      ),
    );
  });
}

class Postly extends StatelessWidget {
  Postly({super.key});

  final firebaseAuthRepo = FirebaseAuthRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubits>(
          create: (context) =>
              AuthCubits(authRepo: firebaseAuthRepo)..checkAuth(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AuthCubits, AuthStates>(
          builder: (context, state) {
            debugPrint(state.toString());
            if (state is UnauthenticatedState) {
              return const LoginPage();
            }

            if (state is AuthenticatedState) {
              return const HomePage();
            } else {
              return Center(
                child: CupertinoActivityIndicator(
                  radius: 15.r,
                  color: AppColors.cPrimary,
                ),
              );
            }
          },
          listener: (context, state) {
            if (state is AuthErrorState) {
              showToast(state.errorMsg);
            }
          },
        ),
      ),
    );
  }
}
