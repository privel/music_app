import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:player_music_project/components/BottomNavigationBar.dart';
import 'package:player_music_project/components/ColorPallet.dart';
import 'screens/HomeScreen.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dolbit Normalbno',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPallets().backGroundColor),  // old colors Colors.deepPirple
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Music'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;

  final List<Widget> _tabs = <Widget>[
    const HomeScreen(),
    const Center(child: Text('Tab 2')),
    const Center(child: Text('Tab 3')),
  ];

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //for Bottom navigation bar

      body: _tabs[_selectedTab],

      bottomNavigationBar: Stack(
        children: [
          //playerMusic(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBarWidget(currentIndex: _selectedTab, onTap: _handleIndexChanged,),
          ),
        ],
      ),
    );
  }




Widget playerMusic() {
  return Positioned(
    bottom: MediaQuery.of(context).size.height * 0.10,
    left: MediaQuery.of(context).size.width * 0.122,
    right: MediaQuery.of(context).size.width * 0.122,
    child: ClipRect( 
      child: Stack(
        children: [
          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), 
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2), 
                
              ),
              height: MediaQuery.of(context).size.height * 0.09,
            ),
          ),
           
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1), 
              
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            child: const Center(
              child: Text(
                'Now Playing',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


 
}

