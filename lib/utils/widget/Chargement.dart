import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget Chargement([bool isVisible = false]) {
  return Visibility(
      visible: isVisible,
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              width: Adaptive.w(double.infinity),
              height: double.infinity.h,
              color: Colors.black45,
            ),
                Positioned(
                  bottom: 80.sp,
                  top: 80.sp,
                  left: 50.sp,
                  child: Container(
            decoration: BoxDecoration(
                  color: Colors_App.Colorwhite,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors_App.Colorblack,
                      offset: Offset(0.sp, 0.sp),
                      blurRadius: 8.sp
                    ),
                  ],
            ),
                  width: Adaptive.w(20),
                  height: 10.h,
                  //color: Colors.black54,
                  child: Center(
                      child: LoadingAnimationWidget.hexagonDots(
                        color: Colors_App.ColorGreen,
                    size: 25.sp,
                  ))),
                ),
              ],
        ),
      ));
}
