import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postly/core/app_assets/app_assets.dart';
import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/app_dimentions/app_spacings.dart';
import 'package:postly/features/auth/presentation/componants/my_button.dart';
import 'package:postly/features/auth/presentation/componants/my_text_field.dart';
import 'package:postly/features/auth/presentation/pages/register_page.dart';
import 'package:postly/features/auth/presentation/vm/auth_vm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auhtVm = AuthVm();

  @override
  Widget build(BuildContext context) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.sizeOf(context).height -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  //logo
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      SvgPicture.asset(AppAssets.logo),
                      Text(
                        'o s t l y',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),

                  // greetings title
                  Spacing.vertical(keyboardVisible ? 30 : 120),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),

                  //email text field
                  Spacing.vertical(30),
                  RPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.kPaddingBottomSheet,
                    ),
                    child: MyTextField(
                      textEditingController: _emailController,
                      hintText: 'Ex: johndoe@gmail.com',
                      obsecureText: false,
                    ),
                  ),

                  //password text field
                  Spacing.vertical(10),
                  RPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.kPaddingBottomSheet,
                    ),
                    child: MyTextField(
                      textEditingController: _passwordController,
                      hintText: '******',
                      obsecureText: true,
                    ),
                  ),
                  // Forgot password option
                  Spacing.vertical(7),
                  RPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.kPaddingBottomSheet,
                    ),
                    child: Row(
                      mainAxisAlignment: .end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot password?',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(fontWeight: .bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // login button
                  Spacing.vertical(30),
                  RPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.kPaddingBottomSheet,
                    ),
                    child: MyButton(
                      buttonName: 'Log In',
                      onTapAction: () => _auhtVm.login(
                        _emailController.text,
                        _passwordController.text,
                        context,
                      ),
                    ),
                  ),

                  // o auth sign in button later (google + apple)

                  // don't have an account? register now
                  Spacing.vertical(70),
                  RPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.kPaddingBottomSheet,
                    ),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Register now',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(fontWeight: .bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
