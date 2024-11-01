import 'package:flutter/material.dart';
import 'package:player_music_project/components/ColorPallet.dart';
import 'package:player_music_project/service/authservice.dart';

// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:iconly/iconly.dart';
// ignore: depend_on_referenced_packages
import 'package:rive_animated_icon/rive_animated_icon.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final currentEmail = FirebaseAuth.instance.currentUser!.email;

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
              Navigator.pop(context);
            },
            icon: const Icon(IconlyLight.logout),
          ),
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: ColorPallets().mainBlackColor,
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    bottom: 10,
                  ),
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
                Text(
                  currentEmail!,
                  style: GoogleFonts.raleway(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "CLICK",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        backgroundColor: Colors.deepOrangeAccent,
                        textColor: Colors.white,
                        fontSize: 14.0,
                      );
                    },
                    child: Container(
                      width: 350,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(28, 26, 24, 36),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.022,
                            left: MediaQuery.of(context).size.width * 0.037),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Subscription is ",
                                  style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "active",
                                  style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromARGB(255, 11, 211, 17),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.045,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Manage",
                                  style: GoogleFonts.raleway(
                                      color: ColorPallets().mainBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: ColorPallets().mainBlackColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  width: 350,
                  height: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(28, 26, 24, 36),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
