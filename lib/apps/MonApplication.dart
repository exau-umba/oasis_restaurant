import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/controller/RepasController.dart';
import 'package:oasis_restaurant/controller/UserController.dart';
import 'package:oasis_restaurant/features/favorie/favorie/favorie_bloc.dart';
import 'package:oasis_restaurant/features/list_foods/list_foods/list_foods_bloc.dart';
import 'package:oasis_restaurant/features/single_food/single_food/single_food_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controller/AuthenticationController.dart';
import '../controller/CategorieController.dart';
import '../features/food_menu/list_menu_food/list_menu_food_bloc.dart';
import '../features/list_home_categorie/list_categorie/categorie_bloc.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> ListMenuFoodBloc()),
            BlocProvider(create: (context)=> CategorieBloc()),
            BlocProvider(create: (context)=> SingleFoodBloc()),
            BlocProvider(create: (context)=> FavorieBloc()),
            BlocProvider(create: (context)=> ListFoodsBloc()),
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