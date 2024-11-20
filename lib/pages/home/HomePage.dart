import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oasis_restaurant/features/favorie/screens/favorie_screen.dart';
import 'package:oasis_restaurant/pages/user/ProfilePage.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../repa/PanierPage.dart';
import 'AccueilPagePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final pages= [
    const AccueilPagePage(),
    //const RechercheFoodPage(),
    const FavorieScreen(),
    const PanierPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: _bottomNav2(),
    );
  }

  Widget _bottomNav(){
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp),),
      child: SalomonBottomBar(
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
            icon: Icon(Icons.favorite),
            title: Text(
                'Favories'
            ),
          ),
          SalomonBottomBarItem(
            icon: Badge(label: Text("8"),child: Icon(Icons.local_grocery_store)),
            title: Text(
                'Panier'
            ),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.reorder),
            title: Text(
                'Paramètre'
            ),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _bottomNav2(){
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp),),
      child: BottomNavigationBar(
        elevation: 0.sp,
        currentIndex: _currentIndex,
        unselectedItemColor: Colors_App.ColorGrey,
        selectedItemColor: Colors_App.ColorYellow,
        //backgroundColor: Colors_App.ColorGreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Badge(label: Text("8"),child: Icon(Icons.local_grocery_store)),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ""
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
