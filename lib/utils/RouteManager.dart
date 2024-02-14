import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/pages/food/ListFoodByCategory.dart';
import 'package:oasis_restaurant/pages/home/AccueilPagePage.dart';
import 'package:oasis_restaurant/pages/welcome/BienvenuPage.dart';
import '../pages/food/category/CategoryPage.dart';
import '../pages/home/HomePage.dart';
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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(seconds: 5),
            key: state.pageKey,
            child: AccueilPagePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                child: child,
              );
            },);
        },
        builder: (BuildContext context, GoRouterState state) {
          return const AccueilPagePage();
        },
      ),
      GoRoute(
        path: Routes.bienvenupage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(seconds: 1),
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
        path: Routes.listFoodByCategorypage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(seconds: 2),
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
    ],
  );
}



