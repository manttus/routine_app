import 'package:flutter/material.dart';
import 'package:herald_app/API/google_sign_in.dart';
import 'package:herald_app/constants/color_constants.dart';
import 'package:herald_app/utils/user_simple_preference.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  const CustomAppBar({
    Key? key,
    this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarDash = AppBar(
      leading: IconButton(
        onPressed: () {
          SimplePreference.clearPreferences();
          GoogleSignInApi.logout();
          Navigator.pushReplacementNamed(context, '/login');
        },
        icon: const Icon(
          Icons.menu,
          color: iconColor,
        ),
      ),
      title: Text(
        titleText!,
        style: const TextStyle(
          color: textColor,
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      backgroundColor: colorWhite,
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/notification");
          },
          icon: const Icon(
            Icons.notifications,
            color: iconColor,
          ),
        ),
      ],
    );

    final appBarNormal = AppBar(
      title: Text(
        titleText!,
        style: const TextStyle(
          color: textColor,
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: const IconThemeData(
        color: textColor,
      ),
      centerTitle: true,
      backgroundColor: colorWhite,
      elevation: 1,
    );

    return ModalRoute.of(context)?.settings.name == '/dashboard'
        ? appBarDash
        : appBarNormal;
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
