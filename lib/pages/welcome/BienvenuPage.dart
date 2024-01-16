import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BienvenuPage extends StatelessWidget {
  const BienvenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/welcome_bg.png"),
                    fit: BoxFit.cover,
                  ))),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.sp,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/icons/logo.png",
                        scale: 4.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Bienvenue chez Oasis Restau, le restaurant de chez vous",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Découvrez une expérience culinaire exceptionnelle et explorez notre menu délicieux à portée de doigt.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors_App.ColorGrise),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  FractionallySizedBox(
                    widthFactor: 3.sp,
                    child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, MyRoutes.registrationRoute);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500),
                          shape: StadiumBorder(),
                          backgroundColor: Colors_App.Colorverte,
                        ),
                        child: Text("Commencer")),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
