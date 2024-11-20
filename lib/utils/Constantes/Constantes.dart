import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

class Constantes{
  static const String  BASE_URL = "https://admin.oasis-rdc.com";
  //static const String  BASE_URL = "http://192.168.1.70:8000";
  static const String  token = "12|HCplmAjIBmpgzoUaips8SwNLd9GIlQfbGz8o2tLpb606a373";

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

  static AppBar WidgetAppBar({
    bool centerTitle=true,
    required String title,
    Color? backgroundColor,
    Color? surfaceTintColor,
    List<Widget>? actions,
    Widget? leading
  }){
    return AppBar(
      leading: leading,
      centerTitle: centerTitle,
      surfaceTintColor: Colors_App.ColorGreen,
      backgroundColor: Colors_App.Colorwhite,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
            color: Colors_App.Colorblack),
      ),
      actions: actions,
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