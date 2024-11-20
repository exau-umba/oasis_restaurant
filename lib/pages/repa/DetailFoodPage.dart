import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/data/models/Food.dart';
import 'package:provider/provider.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:oasis_restaurant/widget/custom_loader.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../features/favorie/favorie/favorie_bloc.dart';
import '../../features/single_food/single_food/single_food_bloc.dart';

class DetailFoodPage extends StatefulWidget {
  final Food food;

  const DetailFoodPage({super.key, required this.food});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  int itemCount = 1;
  var ct;
  int itemPanier = 0;

  int price = 10;

  @override
  void initState() {
    BlocProvider.of<SingleFoodBloc>(context)
        .add(FetchSingleFoodEvent(food: widget.food));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors_App.ColorYellow,
      appBar: AppBar(
        leading: Constantes.leadingAppBar(GoRouter.of(context)),
        backgroundColor: Colors.transparent,
        elevation: 0.sp,
        actions: [
          BlocBuilder<FavorieBloc, FavorieState>(
            builder: (context, state) {
              bool isFavorie = false;

              if(state is FavorieUpdated){
                isFavorie = state.favorites.contains(widget.food);
              }

              return IconButton(
                icon: Icon(isFavorie ? Icons.favorite : Icons.favorite_border,
                  color: isFavorie ? Colors_App.ColorYellow : Colors_App.ColorYellow,),
                onPressed: () {
                  if (isFavorie) {
                    context.read<FavorieBloc>().add(RemoveFromFavorite(widget.food));
                  } else {
                    context.read<FavorieBloc>().add(AddToFavorite(widget.food));
                  }
                },
              );
            },
          )
        ],
      ),
      body: _body(
          nom: widget.food.name,
          desc: widget.food.description,
          img: widget.food.fileImg,
          price: widget.food.price,
          amount: widget.food.amount),
    );
  }

  _body({
    required String? nom,
    required String? desc,
    required String? img,
    required int? price,
    required int? amount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            color: Colors_App.Colorwhite,
            width: Adaptive.w(double.infinity),
            height: double.infinity.h,
            child: Image.network(
              "${Constantes.BASE_URL}$img", fit: BoxFit.cover,),
          ),
        ),
        Container(
          width: Adaptive.w(double.infinity),
          //height: 55.h,
          decoration: BoxDecoration(
              color: Colors_App.ColorGreyPage,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Couleur de l'ombre
                  spreadRadius: 5, // Étendue de l'ombre
                  blurRadius: 6, // Flou de l'ombre
                  offset: Offset(0, 3), // Position de l'ombre
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.sp),
                  topRight: Radius.circular(25.sp))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: Text(
                  "${nom}",
                  style:
                  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${desc}",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Colors_App.ColorGreySection,
                height: 5.h,
                width: Adaptive.w(double.infinity),
                alignment: Alignment.center,
                child: Text(
                  "Choisissez le nombre",
                  style: TextStyle(
                      color: Colors_App.Colorwhite,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                color: Colors_App.ColorGreySection,
                height: 5.h,
                width: Adaptive.w(double.infinity),
                alignment: Alignment.center,
                child: Text(
                  "Choisissez le nombre",
                  style: TextStyle(
                      color: Colors_App.Colorwhite,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      height: 4.h,
                      width: Adaptive.w(15),
                      decoration: BoxDecoration(
                        color: Colors_App.ColorGreySection,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors_App.ColorGreyPage,
                        size: 18.sp,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (itemCount > 1) itemCount--;
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
                    onTap: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.sp),
                      child: Text(
                        "\$${ct = price ?? 1 * itemCount}.00",
                        style: TextStyle(
                            color: Colors_App.Colorblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        backgroundColor:
                        Colors_App.ColorYellow, // Couleur de fond
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ACHETER',
                            style: TextStyle(color: Colors_App.Colorwhite),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors_App.Colorwhite,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Colors_App.ColorYellow, // Couleur de fond
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ajouter au panier',
                        style: TextStyle(color: Colors_App.Colorwhite),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors_App.Colorwhite,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
