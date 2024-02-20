import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/Constantes/PaddingDelimiter.dart';

class RechercheFoodPage extends StatefulWidget {
  const RechercheFoodPage({super.key});

  @override
  State<RechercheFoodPage> createState() => _RechercheFoodPageState();
}

class _RechercheFoodPageState extends State<RechercheFoodPage> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_App.ColorGreyPage,
      appBar: AppBar(
        backgroundColor: Colors_App.Colorwhite,
        bottom: TabBar(
          indicator: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                color: Colors_App.ColorYellow,
              )
            )
          ),
          controller: tabController,
          tabs: [
            Tab(
              child: Text(
                  "Food",
                style: TextStyle(
                  color: Colors_App.Colorblack
                ),
              ),
              icon: Icon(Icons.fastfood, color: Colors_App.Colorblack),
            ),
            Tab(
              child: Text(
                "Categorie",
                style: TextStyle(
                    color: Colors_App.Colorblack
                ),
              ),
              icon: Icon(Icons.category, color: Colors_App.Colorblack),
            ),
          ],
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
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
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: Text("FOOD"),
          ),
          Center(
            child: Text("CATEGORIE"),
          ),
        ],
      ),
    );
  }
}
