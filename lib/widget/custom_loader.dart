

import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      child: Container(
        height: 4.h,
        width: Adaptive.w(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        ),
      ),
    );
  }
}

