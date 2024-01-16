import 'package:flutter/material.dart';
import 'package:oasis_restaurant/pages/welcome/BienvenuPage.dart';
import '../pages/home/HomePage.dart';
import '../pages/welcome/Splashscreen.dart';
import 'Routes.dart';

class RoutesManager {
  static Route? route(RouteSettings r) {
    switch (r.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (_)=> Splashscreen());
      case Routes.bienvenupage:
        return MaterialPageRoute(builder: (_)=>BienvenuPage());
      default:
        return MaterialPageRoute(builder: (_)=> HomePage());
    }
  }
}