import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/Constantes/PaddingDelimiter.dart';
import '../../utils/Routes.dart';

class RechercheFoodPage extends StatefulWidget {
  const RechercheFoodPage({super.key});

  @override
  State<RechercheFoodPage> createState() => _RechercheFoodPageState();
}

class _RechercheFoodPageState extends State<RechercheFoodPage>
    with TickerProviderStateMixin {
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
        toolbarHeight: 45.sp,
        elevation: 0.sp,
        backgroundColor: Colors_App.ColorGreyPage,
        title: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: PaddingDelimiter.paddingHorizontal),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mes favoris",
                        style: TextStyle(
                            fontSize: 20.sp,
                          color: Colors_App.Colorblack
                        ),
                      ),
                    ),
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
      ),
      body: _body(),
    );
/*    return Scaffold(
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
    );*/
  }

  _body() {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.only(
            left: PaddingDelimiter.paddingHorizontal,
            top: PaddingDelimiter.paddingHorizontal),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // number of items in each row
          mainAxisSpacing: 20.sp, // spacing between rows
          crossAxisSpacing: 20.sp, // spacing between columns
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context).push(Routes.detailFoodpage);
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
                            height: 12.h,
                            width: Adaptive.w(double.infinity),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: Image.asset("assets/images/t1.png", fit: BoxFit.cover,)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("Cheese burger", //with_[index],
                            style: TextStyle(
                              color: Colors_App.Colorblack,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            )),
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
                            Text("\$ 25.00", //prices[index],
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black45
                      ),
                      margin: EdgeInsets.only(top: 5.sp, right: 13.sp),
                      width: Adaptive.w(10),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors_App.ColorYellow,
                        ),
                        onPressed: () {
                          showSnackBar(context, "Bientôt disponible");
                        },
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
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors_App.ColorYellow),
                                iconSize: MaterialStatePropertyAll(20.sp),
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
        });
  }

  _bodyNoData(){
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.scale_outlined),
            SizedBox(height: 2.h),
            Text("Vous n'avez pas de favoris"),
          ],
        ),
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
