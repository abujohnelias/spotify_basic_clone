import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_images.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/presentation/authentication/pages/register.dart';
import 'package:spotifyclone/presentation/authentication/pages/sign_in.dart';

class RegisterOrSignInScreen extends StatelessWidget {
  const RegisterOrSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "appLogo",
                    child: SvgPicture.asset(AppVectors.logo),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Enjoy Listning To Music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 350,
                    child: Text(
                      "Unleash your inner audiophile. Explore a universe of unheard music, from forgotten classics to rising stars, all delivered in stunning clarity.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: context.isDarkMode
                            ? AppColors.grey
                            : Colors.grey.shade900,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          title: "Register",
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
