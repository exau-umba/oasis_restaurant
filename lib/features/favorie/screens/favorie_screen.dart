import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/features/favorie/favorie/favorie_bloc.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants.dart';
import '../../../data/models/Food.dart';
import '../../../demoData.dart';
import '../../../utils/Constantes/PaddingDelimiter.dart';
import '../../../utils/Constantes/colors.dart';
import '../../../utils/Routes.dart';
import '../../../widget/food/big/food_info_big_card.dart';
import '../../../widget/scalton/big_card_scalton.dart';

class FavorieScreen extends StatefulWidget {
  const FavorieScreen({super.key});

  @override
  State<FavorieScreen> createState() => _FavorieScreenState();
}

class _FavorieScreenState extends State<FavorieScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constantes.WidgetAppBar(title: "Favoris"),
      body: _body(),
    );
  }

  _body() {
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
    return RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        edgeOffset: 0.5,
        color: Colors_App.ColorYellow,
        key:_refreshIndicatorKey,
        onRefresh: () async {
          //BlocProvider.of<ListFoodsBloc>(context).add(FetchListFoodsEvent());
          //BlocProvider.of<CategorieBloc>(context).add(FetchCategorieEvent());
          return Future.delayed(Duration(seconds: 5));
        },
        child: _gridView()
    );
  }

  _gridView(){
    return BlocBuilder<FavorieBloc, FavorieState>(
      builder: (context, state) {
        if (state is FavorieUpdated && state.favorites.isNotEmpty){
          final List<Food> foods = state.favorites;
          return GridView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.only(
                left: PaddingDelimiter.paddingHorizontal,
                top: PaddingDelimiter.paddingHorizontal),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 20.sp, // spacing between rows
              crossAxisSpacing: 20.sp, // spacing between columns
            ),
            children: foods.asMap().entries.map((e) => InkWell(
              onTap: () {
                GoRouter.of(context).push(Routes.detailFoodpage, extra: e.value.toJson());
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
                                      child: Image(
                                        image:
                                        NetworkImage("${Constantes.BASE_URL}${e.value.fileImg}"),
                                        //images[index],
                                        fit: BoxFit.cover,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text("${e.value.name}", //with_[index],
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
                              Text("\$ ${e.value.price}", //prices[index],
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
                        margin: EdgeInsets.only(top: 5.sp),
                        width: Adaptive.w(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors_App.ColorYellow,
                              ),
                              onPressed: () {
                                //showSnackBar(context, "Bientôt disponible");
                              },
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
            )
            ).toList(),
          );
        }  else{
          return Center(child: Text("Pas de favori"));
        }
      },
    );
  }
}
