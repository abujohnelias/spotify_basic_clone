import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSize {
  final Widget? title;
  final Widget? actions;
  final bool? hideBack;
  final Color? backgroundColor;
  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack = false,
    this.actions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      actions: [actions ?? Container()],
      leading: hideBack == true
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.08)
                      : Colors.black.withOpacity(0.08),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
      title: title ?? const Text(""),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
