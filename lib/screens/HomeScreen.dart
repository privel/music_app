import 'package:flutter/material.dart';
import 'package:player_music_project/components/AppBarComponent.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbarcomponent(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.12,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // RiveAnimation.asset(
                        //   useArtboardSize: true,
                        //   "assets/rive_animation/water_effect_esample.riv",
                        // ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Icon(Icons.play_arrow),
                                Text(
                                  "My Vibe",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),

                    const Row(
                      children: [
                        Column(
                          children: [
                            Card(),
                          ],
                        ),
                        Column(
                          children: [],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
