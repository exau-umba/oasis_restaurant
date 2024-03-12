import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/Constantes/colors.dart';

class ListFoodByCategory extends StatefulWidget {
  const ListFoodByCategory({super.key});

  @override
  State<ListFoodByCategory> createState() => _ListFoodByCategoryState();
}

class _ListFoodByCategoryState extends State<ListFoodByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors_App.ColorGreyPage,
        centerTitle: true,
        elevation: 0.sp,
        title: Text(
          "Categorie",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors_App.Colorblack
          ),
        ),
        leading: Constantes.leadingAppBar(GoRouter.of(context)),
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
                    label: Text("0"),
                    child: Icon(
                      Icons.local_grocery_store_sharp,
                      color: Colors_App.Colorwhite,
                    ),
                  ),
                  onTap: (){

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

  Widget _body(){
    return _element();
  }

  _element(){
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: 20,
        padding: EdgeInsets.only(top: 15.sp),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              GoRouter.of(context).push(Routes.detailFoodpage);
            },
            dense: true,
            leading: Container(
              width: Adaptive.w(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: Image.asset(
                  "assets/images/t3.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("Chawrama"),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("A base de poulet"),
                SizedBox(height: 2.h),
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    child: Icon(Icons.favorite),
                  onTap: (){},
                ),
                SizedBox(width: Adaptive.w(3)),
                InkWell(
                    child: Icon(Icons.add),
                  onTap: (){},

                ),
              ],
            ),
          );
        }
    );
  }
}
