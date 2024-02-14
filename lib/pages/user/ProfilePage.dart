import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_App.ColorGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
    );
  }
}
