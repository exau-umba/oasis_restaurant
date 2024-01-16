import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    return BottomNavigationBar(
      backgroundColor: Colors_App.Colorverte,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors_App.Colorwhite,
      selectedItemColor: Colors_App.ColorJaune,
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedLabelStyle: TextStyle(fontSize: 13.sp),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.home),
          label: 'ACCUEIL',
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
