import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget Chargement([bool isVisible = false]) {
  return Visibility(
      visible: isVisible,
      child: Align(
        alignment: Alignment.center,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            //color: Colors.grey.withOpacity(0.4),
            color: Colors.black54,
            child: Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: Colors_App.ColorGreen,
              secondRingColor: Colors_App.ColorGreen,
              thirdRingColor: Colors_App.ColorYellow,
              size: 30.sp,
            ))),
      ));
}
