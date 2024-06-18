import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/controller/RepasController.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:oasis_restaurant/utils/widget/Chargement.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/AuthenticationController.dart';
import '../../controller/CategorieController.dart';
import '../../controller/UserController.dart';

class BienvenuPage extends StatefulWidget {
  const BienvenuPage({super.key});

  @override
  State<BienvenuPage> createState() => _BienvenuPageState();
}

class _BienvenuPageState extends State<BienvenuPage> {

  Faker fakerData = Faker();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Map dataR = {
      "name":fakerData.person.name(),
      "email":"oasisclient.${fakerData.internet.freeEmail()}",
      "password":"Oasis-client@2024"
    };

    Map data = {
      "email": "umbaexauce233@gmail.com",
      "password": "Oasis-rdc"
    };
    var auth = context.watch<AuthenticationController>();
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
                          color: Colors_App.ColorGrey),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  FractionallySizedBox(
                    widthFactor: 3.sp,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isVisible = true;
                          });
                          GoRouter.of(context).go(Routes.homepage);
                          //_naviguerVersHomePage;
                          //auth.login(data);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500),
                          shape: StadiumBorder(),
                          backgroundColor: Colors_App.ColorGreen,
                        ),
                        child: Text("Commencer")),
                  )
                ],
              ),
            ),
          ),
          Chargement(isVisible)
        ],
      ),
    );
  }
}
