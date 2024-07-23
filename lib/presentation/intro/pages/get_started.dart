import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_images.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/presentation/choose_mode/pages/choose_mode.dart';
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introBG),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Hero(
                  tag: "appLogo",
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo),
                  ),
                ),
                const Spacer(),
                const Text(
                  "Enjoy Listning To Music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Unleash your inner audiophile. Explore a universe of unheard music, from forgotten classics to rising stars, all delivered in stunning clarity.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseModeScreen(),
                        ));
                  },
                  title: "Get Started",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
