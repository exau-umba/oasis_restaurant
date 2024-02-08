import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), (){
      Navigator.pushNamedAndRemoveUntil(context, Routes.bienvenupage, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_App.ColorYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/logo.png", width: Adaptive.w(20),),
              //SizedBox(height: 10.h,),
              //LoadingAnimationWidget.waveDots(color: Colors_App.Colorverte, size: 30.sp),
            ]
        ),
      ),
    );
  }
}
