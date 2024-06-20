

import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  const CustomLoader({
    Key? key,
    this.color = Colors_App.ColorYellow,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

