import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

class Constantes{
  static const String  BASE_URL = "https://admin.oasis-rdc.com";
  static const String  token = "9|3CTu6SPTxdsuhJqplcESjq47O3BN4t3vdXYEhK3h2c2b6dbf";

  static TextStyle styleTitleAppBar = TextStyle(
      color: Colors_App.Colorblack,
      fontWeight: FontWeight.normal,
      fontSize: 18.sp
  );
  static leadingAppBar(GoRouter route){
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors_App.Colorblack, size: 20.sp,),
      onPressed: (){
        route.pop();
      },
    );
  }

  static circleButton({
        required IconData icon,
        required Color color,
    required double size,
        required Function onPressed,
  }){
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(CircleBorder()),
            backgroundColor: MaterialStatePropertyAll(color),
            minimumSize: MaterialStatePropertyAll(Size.fromRadius(size))
        ),
        onPressed: onPressed(),
        child: Icon(icon)
    );
  }

}