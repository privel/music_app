import 'package:flutter/material.dart';
import 'package:player_music_project/screens/Auth/AccountScreen.dart';

class Appbarcomponent extends StatelessWidget implements PreferredSizeWidget {
  const Appbarcomponent({super.key});

  void _personButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () => _personButton(context),
          icon: const Icon(Icons.person),
        )
      ],
      centerTitle: true,
      title: Image.asset("assets/images/cat.png"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
