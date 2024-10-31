import 'package:flutter/material.dart';
import 'package:player_music_project/components/ColorPallet.dart';
import 'package:player_music_project/service/authservice.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.raleway(
            color: ColorPallets().mainBlackColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthService().signout(context: context);
            },
            icon: const Icon(IconlyLight.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0,bottom: 40,),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff1a1824),
                    child: RiveAnimatedIcon(
                      riveIcon: RiveIcon.profile,
                      loopAnimation: true,
                      height: 80,
                      width: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 360,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(152, 26, 24, 36),
                        blurRadius: 6, 
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      ),
                    ],
                   
                  ),
                  
                  child: const Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
