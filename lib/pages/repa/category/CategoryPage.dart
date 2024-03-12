import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        elevation: 0.sp,
        title: Text(
          "Categories",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors_App.Colorblack
          ),
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
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 20.sp, // spacing between rows
          crossAxisSpacing: 20.sp, // spacing between columns
        ),
        padding: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
        itemCount: 8,
        itemBuilder: (context, index){
          return InkWell(
            onTap: () {
              GoRouter.of(context).push(Routes.listFoodByCategorypage);
            },
            child: Card(
                color: Colors_App.ColorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0.sp),
                ),
                elevation: 9.sp,
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          "assets/images/img (1).png",
                          width: Adaptive.w(30),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Positioned(
                        bottom: 15.sp,
                        right: 27.sp,
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: Colors_App.Colorwhite,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )),
          );
        }
    );
  }
}
