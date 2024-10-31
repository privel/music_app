import 'package:flutter/material.dart';
import 'package:player_music_project/components/ColorPallet.dart';
import 'package:player_music_project/screens/AccountScreen/AccountScreen.dart';
import 'package:player_music_project/screens/Auth/login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:player_music_project/screens/HomeScreen.dart';
import 'package:player_music_project/service/authservice.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class Appbarcomponent extends StatelessWidget implements PreferredSizeWidget {
  const Appbarcomponent({super.key});

  void _personButton(BuildContext context) {
    
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountScreen(),
          ),
        );
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          color: ColorPallets().mainBlackColor,
          onPressed: () => _personButton(context),
          icon: const Icon(IconlyLight.profile),
        ),
      ],
      centerTitle: true,
      //title: Image.asset("assets/images/cat.png"),
      title: Text("Sample", style:  GoogleFonts.akronim(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
