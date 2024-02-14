import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:oasis_restaurant/pages/user/ProfilePage.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'AccueilPagePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final pages= [
    AccueilPagePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _bottomNav(){
    return SalomonBottomBar(
      backgroundColor: Colors_App.ColorGreen,
      currentIndex: _currentIndex,
      unselectedItemColor: Colors_App.Colorwhite,
      selectedItemColor: Colors_App.ColorYellow,
      items: [
        SalomonBottomBarItem(
          icon: Icon(Ionicons.home),
          title: Text(
              'Accueil'
          ),
        ),
        SalomonBottomBarItem(
          icon: Icon(Ionicons.person),
          title: Text(
              'Profil'
          ),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
