import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis_restaurant/controller/CategorieController.dart';
import 'package:oasis_restaurant/controller/RepasController.dart';
import 'package:oasis_restaurant/models/CategorieModel.dart';
import 'package:oasis_restaurant/models/RepasModel.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:provider/provider.dart';
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
    'assets/images/bnner3.png',
    'assets/images/banner2.png',
    'assets/images/banner2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var categoryCTrl = context.read<CategorieController>();
    var foodCTrl = context.read<RepasController>();
    foodCTrl.recuperRepasApi();
    categoryCTrl.recuperCategoriesApi();
    return Scaffold(
      appBar: _appBarT(AppBar().preferredSize.height),
      backgroundColor: Colors_App.ColorGreyPage,
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors_App.ColorGreen,
      toolbarHeight: 45.sp,
      elevation: 0.sp,
      title: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bonjour Mr !",
                    style: TextStyle(
                        color: Colors_App.Colorwhite, fontSize: 16.sp),
                  ),
                  Badge(
                      label: Text('0'),
                      child: Icon(
                        Ionicons.notifications,
                        color: Colors_App.Colorwhite,
                      ))
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors_App.Colorwhite,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          blurRadius: 10.sp)
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
              )
            ],
          ),
        ],
      ),
    );
  }

  PreferredSize _appBarT(double height) => PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
        child: Stack(
          children: <Widget>[
            Container(
              // Background
              child: Center(
                child: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors_App.Colorwhite),
                ),
              ),
              color: Colors_App.ColorGreen,
              height: height + 75,
              width: MediaQuery.of(context).size.width,
            ),

            Container(), // Required some widget in between to float AppBar

            Positioned(
              // To take AppBar Size only
              top: 100.0,
              left: 10.0,
              right: 10.0,
              child: AppBar(
                backgroundColor: Colors_App.Colorwhite,
                leading: IconButton(
                  onPressed: (){

                  },
                    icon: Icon(
                  Icons.search,
                  color: Colors_App.ColorGreen,
                )),
                primary: false,
                title: TextField(
                    decoration: InputDecoration(
                        hintText: "Recherche",
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.dp)
                        ),
                        hintStyle: TextStyle(color: Colors_App.ColorGrey)),
                ),
              ),
            )
          ],
        ),
      );

  _body() {
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =GlobalKey<RefreshIndicatorState>();
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              CarouselSlider(
                items: imageUrls.map((url) {
                  return Container(
                    margin: EdgeInsets.all(5.sp),
                    child: Image.asset(
                      url,
                    ),
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
                    margin: EdgeInsets.symmetric(
                        vertical: 5.sp, horizontal: 2.0.sp),
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
              SizedBox(height: 2.h),
              _menuDuJour()
            ],
          ),
        ],
      ),
    );
  }

  _menuDuJour() {
    var foodCtrl = context.read<RepasController>();
    List<RepasModel> menuDuJour = foodCtrl.repas.where((element) => element.isActive==1).toList();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
        color: Colors_App.ColorYellowWithOpacity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: PaddingDelimiter.paddingHorizontal,
                  bottom: PaddingDelimiter.paddingHorizontal,
                  right: PaddingDelimiter.paddingHorizontal),
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
                      Text(
                          "Trouveez ici ce que notre cuisine propose aujourd'hui",
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
                itemCount: menuDuJour.length,
                padding:
                    EdgeInsets.only(left: PaddingDelimiter.paddingHorizontal),
                itemBuilder: (context, index) {
                  var menu = menuDuJour[index];
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Details(index),
                      //     ));
                      context.go(Routes.detailFoodpage, extra: menu);
                    },
                    child: Card(
                      elevation: 0,
                      //color: Colors.white.withOpacity(.1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp)),
                      margin: EdgeInsets.only(
                          right: PaddingDelimiter.paddingHorizontal),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors_App.Colorwhite,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.sp))),
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
                                          image: NetworkImage(
                                              "${Constantes.BASE_URL}${menu.fileImg}"),
                                          //images[index],
                                          fit: BoxFit.cover,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text("${menu.name}", //with_[index],
                                    style: TextStyle(
                                      color: Colors_App.Colorblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    )),
                                SizedBox(
                                  height: 14.sp,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "0.0",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.sp,
                                    ),
                                    Icon(
                                      Ionicons.star,
                                      size: 14.sp,
                                      color: Colors_App.ColorYellow,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14.sp,
                                ),
                                Row(
                                  children: [
                                    Stack(
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
                                    ),
                                    Text("\$ ${menu.price}", //prices[index],
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
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.sp)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "-50%", //ratting[index].toString(),
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
                                onTap: () {
                                  print("Hello");
                                },
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            CircleBorder()),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors_App.ColorYellow),
                                        iconSize:
                                            MaterialStatePropertyAll(20.sp),
                                        minimumSize: MaterialStatePropertyAll(
                                            Size.fromRadius(16.sp))),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 17.sp,
                                    ))),
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
                onTap: () {
                  GoRouter.of(context).push(Routes.listPlat);
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors_App.ColorYellow,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.sp, vertical: 5.sp),
                    margin: EdgeInsets.symmetric(
                        horizontal: PaddingDelimiter.paddingHorizontal),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Voir autres plats",
                          style: TextStyle(color: Colors_App.Colorwhite),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: Colors_App.Colorwhite,
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
          ],
        ),
      ),
    );
  }

  category() {
    var categoryCtrl = context.watch<CategorieController>();
    List<CategorieModel> categoriesActived = categoryCtrl.categories.where((element) => element.isActive==1).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: PaddingDelimiter.paddingHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Que voulez-vous ?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(Routes.categorypage);
                },
                child: Container(
                  padding: EdgeInsets.all(9.sp),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors_App.ColorYellow),
                      color: Colors_App.Colorwhite),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: Colors_App.ColorYellow,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        SizedBox(
          height: 12.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: categoriesActived.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: PaddingDelimiter.paddingHorizontal),
            itemBuilder: (contex, index) {
              var categorie = categoriesActived[index];
              return InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(categorie.name),
                    Container(
                      margin: EdgeInsets.only(
                          right: PaddingDelimiter.paddingHorizontal),
                      padding: EdgeInsets.all(14.sp),
                      height: 9.h,
                      width: Adaptive.w(18),
                      decoration: BoxDecoration(
                          color: Colors_App.ColorGreen,
                          borderRadius: BorderRadius.circular(15.sp)),
                      child: Image.asset("assets/images/img (1).png"),
                    ),
                  ],
                ),
                onTap: () {
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
