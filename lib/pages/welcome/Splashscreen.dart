import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oasis_restaurant/controller/AuthenticationController.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/UserController.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late Timer timer;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<UserController>();
      var auth = context.read<AuthenticationController>();
      Future.delayed(Duration(seconds: 4), () async {
        if(userCtrl.isFirstTimeBienvenue){
          _naviguerVersHomePage();
        }
        GoRouter.of(context).go(Routes.bienvenupage);

        if(await auth.checkConnexion().then((value) => value)){
          //GoRouter.of(context).go(Routes.bienvenupage);
        }

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }
  _naviguerVersHomePage(){
    GoRouter.of(context).go(Routes.homepage);
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer(Duration(seconds: 5), () {
      setState(() {
        /*MotionToast(
            description: Text("Erreur de connexion"),
            primaryColor: Colors_App.Colorwhite
        );*/
      });
    });
    return Scaffold(
      backgroundColor: Colors_App.ColorYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/logo.png", width: Adaptive.w(30),),
              SizedBox(height: 10.h,),
              LoadingAnimationWidget.hexagonDots(color: Colors_App.ColorGreen, size: 30.sp),
            ]
        ),
      ),
    );
  }
}
