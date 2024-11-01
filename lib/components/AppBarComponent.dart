import 'package:flutter/material.dart';
import 'package:player_music_project/components/ColorPallet.dart';
import 'package:player_music_project/screens/AccountScreen/AccountScreen.dart';
import 'package:player_music_project/screens/Auth/login.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:iconly/iconly.dart';

class Appbarcomponent extends StatelessWidget implements PreferredSizeWidget {
  const Appbarcomponent({super.key});

  void _personButton(BuildContext context) {
    
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      } else {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const AccountScreen(),
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
