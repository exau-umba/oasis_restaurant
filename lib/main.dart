import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/apps/MonApplication.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    print(details.stack);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/reactionsApp/errorInatendu.gif"),
              Text("${details.exception}")
            ]),
      ),
    );
  };
  runApp(MonApplication());
}
