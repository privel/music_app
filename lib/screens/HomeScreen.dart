import 'package:flutter/material.dart';

//Flutter plugins
import 'package:draggable_home/draggable_home.dart'; // for AppBar
import 'package:player_music_project/components/AppBarComponent.dart';

import 'package:rive_animated_icon/rive_animated_icon.dart';

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
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.00009,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Text("123"),
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
