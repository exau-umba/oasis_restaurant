import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oasis_restaurant/pages/welcome/Splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/RouteManager.dart';
import 'package:go_router/go_router.dart';
import '../utils/Routes.dart';

class MonApplication extends StatelessWidget{
  GetStorage stockage =GetStorage();

  MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: RoutesManager.router,

        );
      },
    );
  }

}