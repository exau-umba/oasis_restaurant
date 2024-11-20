import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/data/models/Food.dart';
import 'package:oasis_restaurant/models/RepasModel.dart';
import 'package:oasis_restaurant/pages/home/AccueilPagePage.dart';
import 'package:oasis_restaurant/pages/repa/ListPlatPage.dart';
import 'package:oasis_restaurant/pages/welcome/BienvenuPage.dart';
import '../pages/home/HomePage.dart';
import '../pages/repa/DetailFoodPage.dart';
import '../pages/repa/ListFoodByCategory.dart';
import '../pages/repa/PanierPage.dart';
import '../pages/repa/RechercheFoodPage.dart';
import '../pages/repa/category/CategoryPage.dart';
import '../pages/welcome/Splashscreen.dart';
import 'Routes.dart';

class RoutesManager {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashscreen,
    routes: [
      GoRoute(
        path: Routes.splashscreen,
        builder: (BuildContext context, GoRouterState state) {
          return  Splashscreen();
        },
      ),
      GoRoute(
        path: Routes.accueilpage,
        builder: (BuildContext context, GoRouterState state) {
          return const AccueilPagePage();
        },
      ),
      GoRoute(
        path: Routes.bienvenupage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            //transitionDuration: const Duration(milliseconds: 120),
            key: state.pageKey,
            child: BienvenuPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInToLinear).animate(animation),
              child: child,
            );
          },);
        },
        builder: (BuildContext context, GoRouterState state) {
          return  BienvenuPage();
        },
      ),
      GoRoute(
        path: Routes.categorypage,
        builder: (BuildContext context, GoRouterState state) {
          return  CategoryPage();
        },
      ),
      GoRoute(
        path: Routes.homepage,
        builder: (BuildContext context, GoRouterState state) {
          return  HomePage();
        },
      ),
      GoRoute(
        path: Routes.listPlat,
        builder: (BuildContext context, GoRouterState state) {
          return  ListPlatPage();
        },
      ),
      GoRoute(
        path: Routes.listFoodByCategorypage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 120),
            key: state.pageKey,
            child: ListFoodByCategory(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                child: child,
              );
            },);
        },
        builder: (BuildContext context, GoRouterState state) {
          return  ListFoodByCategory();
        },
      ),
      GoRoute(
        path: Routes.rechercheFoodpage,
        builder: (BuildContext context, GoRouterState state) {
          return  RechercheFoodPage();
        },
      ),
      GoRoute(
        path: Routes.detailFoodpage,
        builder: (BuildContext context, GoRouterState state) {
          final foodMap = state.extra as Map<String, dynamic>;
          final food = Food.fromJson(foodMap);
          print("================================================");
          print("================================================ : ${food.name}");
          return  DetailFoodPage(food: food,);
        },
      ),
      GoRoute(
        path: Routes.panierpage,
        builder: (BuildContext context, GoRouterState state) {
          return  PanierPage();
        },
      ),
    ],
  );
}



