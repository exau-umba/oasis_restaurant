import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccueilPagePage extends StatefulWidget {
  const AccueilPagePage({super.key});

  @override
  State<AccueilPagePage> createState() => _AccueilPagePageState();
}

class _AccueilPagePageState extends State<AccueilPagePage> {

  int _currentIndex = 0;
  final List<String> imageUrls = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar (
        backgroundColor: Colors_App.Colorverte,
        title:Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 16),
                child: Icon(Ionicons.person, size: 25.sp,)
            ),
            Expanded(
                flex: 3,
                child: Container(
                  //margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning",
                        style: TextStyle(
                            color: Color(0xff979899),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 0.8.h,
                      ),
                      Text(
                        "Amelia Barlow",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors_App.ColorJaune,
                    borderRadius: BorderRadius.circular(8.sp)
                ),
                child: Icon(Ionicons.notifications, color:Colors_App.Colorverte)),
          )
        ],
      ),*/
      backgroundColor: Colors_App.ColorGreyPage,
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: Colors_App.ColorGreen,
            padding: EdgeInsets.symmetric(horizontal: 14.sp),
            width: Adaptive.w(double.infinity),
            height: 15.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bonjour Mr !",
                  style: TextStyle(
                    color: Colors_App.Colorwhite
                  ),
                ),
                Badge(
                  backgroundColor: Colors_App.ColorYellow,
                    label: Text('0'),
                    child: Icon(Ionicons.settings_outline, color: Colors_App.Colorwhite,)
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 10.h,
              ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors_App.Colorwhite,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, offset: Offset(0, 1), blurRadius: 10.sp)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24.sp))),
                    child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Recherche...",
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors_App.ColorGrey,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.all(18.sp),
                          prefixIcon: Icon(
                            Ionicons.search,
                            color: Colors_App.ColorGreen,
                          ),
                        )),
                  )),

              CarouselSlider(
                items: imageUrls.map((url) {
                  return Container(
                    margin: EdgeInsets.all(5.sp),
                    child: Image.asset(url,),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              //SizedBox(height: 0.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageUrls.map((url) {
                  int index = imageUrls.indexOf(url);
                  return Container(
                    width: Adaptive.w(3),
                    height: 1.h,
                    margin: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 2.0.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors_App.ColorYellow
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              category(),
              SizedBox(height: 0.8.h),
              _menuDuJour()
            ],
          ),
        ],
      ),
    );
  }


  _menuDuJour(){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
        color: Colors_App.ColorYellowWithOpacity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: PaddingDelimiter.paddingHorizontal, bottom: PaddingDelimiter.paddingHorizontal, right: PaddingDelimiter.paddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Menu du jour ",
                          style: TextStyle(
                            color: Colors_App.ColorYellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          )),
                      Text("Trouveez ici ce que notre cuisine propose aujourd'hui",

                          style: TextStyle(
                            color: Colors_App.ColorYellow,
                            fontSize: 15.sp,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 33.h,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                padding: EdgeInsets.only(left: PaddingDelimiter.paddingHorizontal),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Details(index),
                      //     ));
                      GoRouter.of(context).push(Routes.detailFoodpage);
                    },
                    child: Card(
                      elevation: 0,
                      //color: Colors.white.withOpacity(.1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp)),
                      margin: EdgeInsets.only(right: PaddingDelimiter.paddingHorizontal),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors_App.Colorwhite,
                              borderRadius: BorderRadius.all(Radius.circular(15.sp))
                            ),
                            padding: EdgeInsets.all(10.sp),
                            width: Adaptive.w(50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                              image: AssetImage("assets/images/t1.png"),//images[index],
                                              fit: BoxFit.cover,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                                Text("Cheese burger",//with_[index],
                                    style: TextStyle(
                                      color: Colors_App.Colorblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    )),
                                SizedBox(height: 14.sp,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("0.0",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 8.sp,),
                                    Icon(Ionicons.star, size: 14.sp, color: Colors_App.ColorYellow,)
                                  ],
                                ),
                                SizedBox(height: 14.sp,),
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("\$ 30.00 ",
                                              style: TextStyle(
                                                  color: Colors_App.ColorGrey,
                                                  fontSize: 14.sp
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 11.sp),
                                          height: 0.1.h,
                                          width: Adaptive.w(9),
                                          color: Colors_App.ColorGrey,
                                        )
                                      ],
                                    ),
                                    Text("\$ 25.00",//prices[index],
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
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.only(top: 15.sp),
                              height: 3.h,
                              width: Adaptive.w(15),
                              decoration: BoxDecoration(
                                color: Colors_App.ColorYellow,
                                borderRadius:
                                BorderRadius.only(
                                    topLeft:
                                    Radius.circular(
                                        12.sp)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "-50%",//ratting[index].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0.sp,
                            bottom: 5.sp,
                              child: InkWell(
                                onTap: (){
                                  print("Hello");
                                },
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(CircleBorder()),
                                        backgroundColor: MaterialStatePropertyAll(Colors_App.ColorYellow),
                                        iconSize: MaterialStatePropertyAll(20.sp),
                                        minimumSize: MaterialStatePropertyAll(Size.fromRadius(16.sp))
                                    ),
                                    onPressed: (){
                                      setState(() {
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 17.sp,
                                    )
                                )
                              ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
             SizedBox(
              height: 2.h,
            ),
            //specialCard(images[7]),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: (){},
                child: Container(
                        decoration: BoxDecoration(
                          color: Colors_App.ColorYellow,
                          borderRadius: BorderRadius.circular(50.sp),
                        ),
                          padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 5.sp),
                          margin: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Voir tout",
                                style: TextStyle(
                                  color: Colors_App.Colorwhite
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors_App.Colorwhite,)
                            ],
                          )
                      ),
              ),
            ),
            SizedBox(
              height: 50.sp,
            ),
          ],
        ),
      ),
    );
  }

  category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Que voulez-vous ?",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              ),
              InkWell(
                onTap: (){
                  GoRouter.of(context).push(Routes.categorypage);
                },
                child: Container(
                  padding: EdgeInsets.all(9.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors_App.ColorYellow),
                    color: Colors_App.Colorwhite
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: Colors_App.ColorYellow,),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8.sp,),
        SizedBox(
          height: 12.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
            itemBuilder: (contex, index){
              return InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Burger"),
                    Container(
                      margin: EdgeInsets.only(right: PaddingDelimiter.paddingHorizontal),
                      padding: EdgeInsets.all(14.sp),
                      height: 9.h,
                      width: Adaptive.w(18),
                      decoration: BoxDecoration(
                          color: Colors_App.ColorGreen,
                          borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Image.asset("assets/images/img (1).png"),
                    ),
                  ],
                ),
                onTap: (){
                  GoRouter.of(context).push(Routes.listFoodByCategorypage);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
