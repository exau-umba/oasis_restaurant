import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/controller/RepasController.dart';
import 'package:oasis_restaurant/controller/UserController.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controller/AuthenticationController.dart';
import '../controller/CategorieController.dart';
import '../utils/RouteManager.dart';

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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> AuthenticationController(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> UserController(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> CategorieController(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> RepasController(stockage: stockage)),
          ],
          child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: RoutesManager.router,

          ),
        );
      },
    );
  }

}