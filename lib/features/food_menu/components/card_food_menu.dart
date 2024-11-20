import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/Constantes/PaddingDelimiter.dart';
import '../../../utils/Constantes/colors.dart';

class CardFoodMenu extends StatelessWidget {
  final String name;
  final String desc;
  final String file_img;
  final int price;
  final bool isNetwork;
  final Function onTap;

  const CardFoodMenu(
      {super.key,
      required this.name,
      required this.desc,
      required this.file_img,
      required this.price,
      required this.onTap,
      this.isNetwork = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.sp,
      color: Colors.white.withOpacity(.1),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
      margin: EdgeInsets.only(right: PaddingDelimiter.paddingHorizontal),
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors_App.Colorwhite,
                  borderRadius: BorderRadius.all(Radius.circular(15.sp))),
              padding: EdgeInsets.all(10.sp),
              width: Adaptive.w(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.sp),
                      topRight: Radius.circular(12.sp),
                    ),
                    child: SizedBox(
                      height: 18.h,
                      width: Adaptive.w(double.infinity),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image(
                            image: NetworkImage(file_img),
                            //images[index],
                            fit: BoxFit.cover,
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text("${name}", //with_[index],
                      style: TextStyle(
                        color: Colors_App.Colorblack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text("${desc}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors_App.Colorblack,
                        fontSize: 15.sp,
                      )),
                  /*Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "0.0",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: Adaptive.w(2),
                      ),
                      Icon(
                        Ionicons.star,
                        size: 14.sp,
                        color: Colors_App.ColorYellow,
                      )
                    ],
                  ),*/
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    children: [
                      /*Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("\$ 30.00 ",
                                style: TextStyle(
                                    color: Colors_App.ColorGrey,
                                    fontSize: 14.sp)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 11.sp),
                            height: 0.1.h,
                            width: Adaptive.w(9),
                            color: Colors_App.ColorGrey,
                          )
                        ],
                      ),*/
                      Text("\$ $price",
                          //prices[index],
                          style: TextStyle(
                            color: Colors_App.Colorblack,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            /*Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 15.sp),
                height: 3.h,
                width: Adaptive.w(15),
                decoration: BoxDecoration(
                  color: Colors_App.ColorYellow,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(12.sp)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "-50%",
                      //ratting[index].toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),*/
            /*Positioned(
              right: 0.sp,
              bottom: 16.sp,
              child: InkWell(
                  onTap: () {
                    print("");
                  },
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(CircleBorder()),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors_App.ColorYellow),
                          iconSize: MaterialStatePropertyAll(20.sp),
                          minimumSize:
                              MaterialStatePropertyAll(Size.fromRadius(16.sp))),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors_App.Colorwhite,
                        size: 17.sp,
                      ))),
            )*/
          ],
        ),
      ),
    );
  }
}
