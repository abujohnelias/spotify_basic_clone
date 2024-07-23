import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/data/models/authentication/create_user_req.dart';
import 'package:spotifyclone/domain/usecases/authentication/signup_usecase.dart';
import 'package:spotifyclone/presentation/authentication/pages/sign_in.dart';
import 'package:spotifyclone/presentation/home/pages/home.dart';
import 'package:spotifyclone/service_locator.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Hero(
          tag: "appLogo",
          child: SvgPicture.asset(
            AppVectors.logo,
            height: 35,
            width: 35,
          ),
        ),
      ),
      bottomNavigationBar: _signinText(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: _fullNameField(context),
            ),
            _emailField(context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: _passwordField(context),
            ),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SignupUsecase>().call(
                  params: CreateUserReq(
                    fullName: _fullnameController.text.toString(),
                    email: _emailController.text.toString(),
                    password: _passwordController.text.toString(),
                  ),
                );

                result.fold(
                  (l) {
                    var snackBar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              title: "Create Account",
            )
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullnameController,
      decoration: const InputDecoration(hintText: 'Full Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Do you have an account?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ));
            },
            child: const Text("Sign In"),
          )
        ],
      ),
    );
  }
}
