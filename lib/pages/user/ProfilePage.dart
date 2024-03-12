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
      backgroundColor: Colors_App.ColorGreyPage,
      appBar: AppBar(
        backgroundColor: Colors_App.ColorGreen,
        toolbarHeight: 45.sp,
        elevation: 0.sp,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Ionicons.person_circle, size: 38.sp,),
            SizedBox(width: Adaptive.w(2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Guest User",
                  style: TextStyle(
                    fontSize: 18.sp
                  ),
                ),
                Divider(height: 0.5.h),
                Text(
                    "${DateTime.now()}",
                  style: TextStyle(
                    fontSize: 15.sp
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: PaddingDelimiter.paddingHorizontal, top: 20.sp, bottom: 18.sp),
            child: Text(
              "Information générale",
              style: TextStyle(color: Colors_App.ColorYellow, fontWeight: FontWeight.w500),),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal,),
            decoration: BoxDecoration(
                color: Colors_App.Colorwhite,
                borderRadius: BorderRadius.circular(15.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors_App.Colorblack,
                    offset: Offset(0.sp, 0.sp),
                    blurRadius: 5.sp,
                    //spreadRadius: 0.sp
                  )
                ]
            ),
            child: Column(
              children: [
                ListTile(leading: Icon(Ionicons.person_outline), title: Text("Profile"),
                  onTap: (){
                    showSnackBar(context, "Profil bientôt disponible");
                }, dense: true,),
                Divider(height: 0.sp),
                ListTile(leading: Icon(Ionicons.location_outline), title: Text("Mon adresse"),
                  onTap: (){
                    showSnackBar(context, "Adresse bientôt disponible");
                }, dense: true,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: PaddingDelimiter.paddingHorizontal, top: 20.sp, bottom: 18.sp),
            child: Text(
              "Aide & support",
              style: TextStyle(color: Colors_App.ColorYellow, fontWeight: FontWeight.w500),),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
            decoration: BoxDecoration(
                color: Colors_App.Colorwhite,
                borderRadius: BorderRadius.circular(15.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors_App.Colorblack,
                    offset: Offset(0, 0),
                    blurRadius: 6.sp,
                  )
                ]
            ),
            child: Column(
              children: [
                ListTile(leading: Icon(Icons.library_books), title: Text("Termes & conditions d'utilisation"),
                  onTap: (){
                    showSnackBar(context, "Bientôt disponible");
                  }, dense: true,),
                Divider(height: 0.sp),
                ListTile(leading: Icon(Icons.help_outline), title: Text("Aide"),
                  onTap: (){
                    showSnackBar(context, "Bientôt disponible");
                  }, dense: true,),
                Divider(height: 0.sp),
                ListTile(leading: Icon(Icons.info_outline), title: Text("A propos"),
                    onTap: (){
                      showSnackBar(context, "Bientôt disponible");
                    }, dense: true),
              ],
            ),
          ),

        ],
      ),
    );
  }

  _section(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal, vertical: 25.sp),
      decoration: BoxDecoration(
        color: Colors_App.Colorwhite,
        borderRadius: BorderRadius.circular(15.sp),
        boxShadow: [
          BoxShadow(
            color: Colors_App.Colorblack,
            offset: Offset(0, 0),
            blurRadius: 6.sp,
          )
        ]
      ),
      child: ListView(
          padding: EdgeInsets.all(20.sp),
          shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(Icons.person_3_outlined, size: 20.sp,),
            title: Text("Profile"),
            minLeadingWidth: 20.sp,
            onTap: (){
              //showSnackBar(context, "Bientôt disponible");
            },
          ),
          Divider(),
          ListTile(leading: Icon(Icons.person_3_outlined, size: 20.sp,), title: Text("Profile"),),
          Divider(),
          ListTile(leading: Icon(Icons.person_3_outlined, size: 20.sp,), title: Text("Profile"),),
        ],
      ),
    );
  }

  showSnackBar(context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      action:
      SnackBarAction(label: 'OK',
          textColor: Colors.orange,
          onPressed: scaffold.hideCurrentSnackBar),
    ));
  }
}
