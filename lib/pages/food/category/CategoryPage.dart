import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/Constantes/PaddingDelimiter.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_App.ColorGreyPage,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories",
          style: Constantes.styleTitleAppBar,
        ),
        backgroundColor: Colors_App.Colorwhite,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios, color: Colors_App.Colorblack, size: 20.sp,)),
      ),
      body: _body(),
    );
  }

  _body() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
        padding: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
        itemCount: 21,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              GoRouter.of(context).push(Routes.listFoodByCategorypage);
              /*MotionToast.info(
                title:  Text("Pas disponible"),
                description:  Text("Cette fonctionnalité n'est pas encore dispo"),
              ).show(context);*/
            },
            child: Container(
              padding: EdgeInsets.all(12.sp),
              height: 2.h,
              width: Adaptive.w(15),
              decoration: BoxDecoration(
                  color: Colors_App.Colorwhite,
                  borderRadius: BorderRadius.circular(15.sp)
              ),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                        color: Colors_App.ColorGreen,
                          borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Image.asset("assets/images/img (1).png")
                  ),
                  Positioned(
                    bottom: 0.sp,
                      left: 20.5.sp,
                      child: Text("Burger")
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
