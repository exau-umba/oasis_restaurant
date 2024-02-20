import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_App.ColorGreyPage,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors_App.Colorwhite,
        title: Text(
            "Profile",
          style: Constantes.styleTitleAppBar,
        ),
      ),
    );
  }
}
