import 'package:flutter/material.dart';

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart'; // Bottom Navigation Bar
import 'package:iconly/iconly.dart'; // Icons
import 'package:player_music_project/components/ColorPallet.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart'; // Rive Icon Animation

import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 1,
        
      

        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.09,
          vertical: MediaQuery.of(context).size.height * 0.026,
        ),
        color: ColorPallets().mainBlackColor,
        activeColor: ColorPallets().mainBlackColor,
        onTabChange: widget.onTap,
        selectedIndex: widget.currentIndex,
        backgroundColor: Colors.white,
        tabs: [
          GButton(
            icon: IconlyLight.home,
            
            text: 'Home',
          ),
          GButton(
            icon: IconlyLight.heart,
            text: 'Likes',
          ),
          GButton(
            icon: IconlyLight.search,
            text: 'Search',
          ),
        ]);
  }

  Widget crystalBar() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: CrystalNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        indicatorColor: Colors.white,
        borderRadius: 20,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.black.withOpacity(0.2),
        enableFloatingNavBar: true,
        margin: const EdgeInsets.only(bottom: 0),
        items: [
          // Home
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Colors.black,
          ),
          // Favourite
          CrystalNavigationBarItem(
            icon: IconlyBold.heart,
            unselectedIcon: IconlyLight.heart,
            selectedColor: Colors.red,
          ),
          // Add
          CrystalNavigationBarItem(
            icon: IconlyBold.plus,
            unselectedIcon: IconlyLight.plus,
            selectedColor: Colors.white,
          ),
          // Search
          CrystalNavigationBarItem(
              icon: IconlyBold.search,
              unselectedIcon: IconlyLight.search,
              selectedColor: Colors.white),
          // Profile
          CrystalNavigationBarItem(
            icon: IconlyBold.user_2,
            unselectedIcon: IconlyLight.user,
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
