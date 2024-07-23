import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/data/models/authentication/signin_user_req.dart';
import 'package:spotifyclone/domain/usecases/authentication/signin_usecase.dart';
import 'package:spotifyclone/presentation/authentication/pages/register.dart';
import 'package:spotifyclone/presentation/home/pages/home.dart';
import 'package:spotifyclone/service_locator.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignInScreen({super.key});

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
      bottomNavigationBar: _registerText(context),
      body: SingleChildScrollView(  padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: _emailField(context),
            ),
            _passwordField(context),
            const SizedBox(height: 24),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SigninUserReq(
                    email: _emailController.text.toString(),
                    password: _passwordController.text.toString(),
                  ),
                );
        
                result.fold(
                  (l) {
                    var snackBar =  SnackBar(content: Text(l));
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
              title: "Sign In",
            )
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
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

  Widget _registerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not a member?",
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
                    builder: (context) => RegisterScreen(),
                  ));
            },
            child: const Text("Register Now"),
          )
        ],
      ),
    );
  }
}
