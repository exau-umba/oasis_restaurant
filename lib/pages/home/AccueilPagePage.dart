import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Icon(Ionicons.person),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
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
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors_App.ColorJaune,
                    borderRadius: BorderRadius.circular(8.sp)
                  ),
                    child: Icon(Ionicons.notifications, color:Colors_App.Colorverte))
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      hintText: "Recherche Categorie",
                      hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors_App.ColorGrise,
                          fontWeight: FontWeight.w500),
                      contentPadding: EdgeInsets.all(18.sp),
                      prefixIcon: Icon(
                        Ionicons.search,
                        color: Colors_App.Colorverte,
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
          SizedBox(height: 0.sp,),
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
                      ? Colors_App.ColorJaune
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
