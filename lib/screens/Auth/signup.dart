import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:player_music_project/components/ColorPallet.dart';
import 'package:player_music_project/screens/Auth/login.dart';
import 'package:player_music_project/service/authservice.dart';


import 'package:rive_animated_icon/rive_animated_icon.dart';

import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: _signin(context),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 50,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: RiveAnimatedIcon(
                      riveIcon: RiveIcon.edit,
                      loopAnimation: true,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Register Account',
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            color: Color(0xff1a1824),
                            fontWeight: FontWeight.bold,
                            fontSize: 32)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                _emailAddress(),
                const SizedBox(
                  height: 20,
                ),
                _password(),
                const SizedBox(
                  height: 50,
                ),
                _signup(context),
              ],
            ),
          ),
        ));
  }

  Widget _emailAddress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16)),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
              filled: true,
              hintText: 'mahdiforwork@gmail.com',
              hintStyle: const TextStyle(
                  color: Color(0xff6A6A6A),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16)),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _signup(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPallets().mainBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(double.infinity, 50),
        elevation: 0,
      ),
      onPressed: () async {
        await AuthService().signup(
            email: _emailController.text,
            password: _passwordController.text,
            context: context);
      },
      child: const Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _signin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            const TextSpan(
              text: "Already Have Account? ",
              style: TextStyle(
                  color: Color(0xff6A6A6A),
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            TextSpan(
                text: "Log In",
                style: const TextStyle(
                    color: Color(0xff1a1824),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Login()),
                    // );
                    Navigator.pop(context);
                    
                  }),
          ])),
    );
  }
}
