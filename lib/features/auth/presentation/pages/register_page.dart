import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postly/core/app_assets/app_assets.dart';
import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/app_dimentions/app_spacings.dart';
import 'package:postly/features/auth/presentation/componants/my_button.dart';
import 'package:postly/features/auth/presentation/componants/my_text_field.dart';
import 'package:postly/features/auth/presentation/pages/login_page.dart';
import 'package:postly/features/auth/presentation/vm/auth_vm.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authVM = AuthVm();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                    'Create an new account',
                    textAlign: .center,
                    style: Theme.of(
                      context,
                    ).textTheme.displaySmall!.copyWith(fontSize: 25.sp),
                  ),
                  // name text field
                  Spacing.vertical(40),
                  RPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.kPaddingBottomSheet,
                    ),
                    child: MyTextField(
                      textEditingController: _nameController,
                      hintText: 'Ex: John Doe',
                      obsecureText: false,
                    ),
                  ),

                  //email text field
                  Spacing.vertical(10),
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

                  // login button
                  Spacing.vertical(30),
                  RPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.kPaddingBottomSheet,
                    ),
                    child: MyButton(
                      buttonName: 'Register',
                      onTapAction: () => _authVM.register(
                        _nameController.text,
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
                          "Already have an account? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Log In now',
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
