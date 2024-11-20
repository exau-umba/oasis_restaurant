import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors_App.ColorGreyPage,
      appBar: Constantes.WidgetAppBar(
          title: "Profile",
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
        ]
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: PaddingDelimiter.paddingHorizontal,
            vertical: 40.sp
          ),
          decoration: BoxDecoration(
              color: Colors_App.Colorwhite,
              borderRadius: BorderRadius.circular(15.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Couleur de l'ombre
                  spreadRadius: 5, // Étendue de l'ombre
                  blurRadius: 6, // Flou de l'ombre
                  offset: Offset(0, 3), // Position de l'ombre
                ),
              ]),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Nom"),
                  Text("Nom complet"),
                ],),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Divider(height: 0.sp),
              ),
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email"),
                    Text("email@example.com"),
                  ],),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Divider(height: 0.sp),
              ),
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Statut"),
                    Container(padding: EdgeInsets.all(8.sp),color: Colors_App.ColorGreen,child: Text("Actif", style: TextStyle(color: Colors_App.Colorwhite),)),
                  ],),
              ),
            ],
          ),
        ),
        Container(
            alignment: Alignment.topCenter,
            child: Icon(Ionicons.person_circle, size: 40.sp, color: Colors_App.ColorYellow,)),
      ],
    );
  }

  _section() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: PaddingDelimiter.paddingHorizontal, vertical: 25.sp),
      decoration: BoxDecoration(
          color: Colors_App.Colorwhite,
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
              color: Colors_App.Colorblack,
              offset: Offset(0, 0),
              blurRadius: 6.sp,
            )
          ]),
      child: ListView(
        padding: EdgeInsets.all(20.sp),
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(
              Icons.person_3_outlined,
              size: 20.sp,
            ),
            title: Text("Profile"),
            minLeadingWidth: 20.sp,
            onTap: () {
              //showSnackBar(context, "Bientôt disponible");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.person_3_outlined,
              size: 20.sp,
            ),
            title: Text("Profile"),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.person_3_outlined,
              size: 20.sp,
            ),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }

  showSnackBar(context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'OK',
          textColor: Colors.orange,
          onPressed: scaffold.hideCurrentSnackBar),
    ));
  }
}
