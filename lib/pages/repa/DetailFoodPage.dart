import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/models/RepasModel.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailFoodPage extends StatefulWidget {
  final RepasModel? food;
  DetailFoodPage({super.key, this.food});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  int itemCount = 1;
  var ct;
  int itemPanier = 0;
  int price = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Constantes.leadingAppBar(GoRouter.of(context)),
        backgroundColor: Colors.transparent,
        elevation: 0.sp,
        actions: [
          Container(
            padding: EdgeInsets.all(5.sp),
            margin: EdgeInsets.all(15.sp),
            width: Adaptive.w(25),
            decoration: BoxDecoration(
                color: Colors_App.ColorYellow,
                borderRadius: BorderRadius.circular(10.sp)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Icon(Icons.search,),
                  onTap: (){

                  },
                ),
                InkWell(
                  child: Badge(
                    label: Text("$itemPanier"),
                    child: Icon(
                      Icons.local_grocery_store_sharp,
                      color: Colors_App.Colorwhite,
                    ),
                  ),
                  onTap: (){
                    GoRouter.of(context).push(Routes.panierpage);
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Adaptive.w(double.infinity),
            height: 30.h,
            child: PageView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.sp),
                    child: Image.network(
                        "${Constantes.BASE_URL}${widget.food?.fileImg}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),Container(
                  margin: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.sp),
                    child: Image.asset(
                      "assets/images/t1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: PaddingDelimiter.paddingHorizontal,
              right: PaddingDelimiter.paddingHorizontal,
              top: 20.sp
            ),
            width: Adaptive.w(double.infinity),
            height: 55.h,
            decoration: BoxDecoration(
              color: Colors_App.ColorGreyPage,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.sp),
                topRight: Radius.circular(30.sp)
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "${widget.food?.name}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              height: 4.h,
                              width: Adaptive.w(15),
                              decoration: BoxDecoration(
                                color: Colors_App.ColorGrey,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors_App.ColorGreyPage,
                                size: 18.sp,
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                if (itemCount > 0) itemCount--;
                              });
                            },
                          ),
                          Text("${itemCount}"),
                          InkWell(
                            child: Container(
                              height: 4.h,
                              width: Adaptive.w(15),
                              decoration: BoxDecoration(
                                color: Colors_App.ColorYellow,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors_App.Colorwhite,
                                size: 18.sp,
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                itemCount++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                      "\$10",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Description",
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                          "Duis in neque efficitur. Vestibulum semper arcu et enim tempus cursus. Donec tincidunt dolor neque. Sed sed.",
                        style: TextStyle(
                          fontSize: 20.sp
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Total :",
                        style: TextStyle(
                            fontSize: 20.sp,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(""
                          "\$${ct=price*itemCount}",
                        style: TextStyle(
                          fontSize: 20.sp
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  FractionallySizedBox(
                    widthFactor: 4.3.sp,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            itemPanier++;
                          });
                          //GoRouter.of(context).push(Routes.panierpage);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.sp),
                          textStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                          shape: StadiumBorder(),
                          backgroundColor: Colors_App.ColorGreen,
                        ),
                        child: Text("Ajouter au panier")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
