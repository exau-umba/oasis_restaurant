import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis_restaurant/constants.dart';
import 'package:oasis_restaurant/controller/CategorieController.dart';
import 'package:oasis_restaurant/controller/RepasController.dart';
import 'package:oasis_restaurant/data/models/Categorie.dart';
import 'package:oasis_restaurant/data/models/Food.dart';
import 'package:oasis_restaurant/features/food_menu/components/card_food_menu.dart';
import 'package:oasis_restaurant/features/list_foods/list_foods/list_foods_bloc.dart';
import 'package:oasis_restaurant/models/RepasModel.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:oasis_restaurant/utils/Routes.dart';
import 'package:oasis_restaurant/utils/data.dart';
import 'package:oasis_restaurant/widget/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../features/food_menu/list_menu_food/list_menu_food_bloc.dart';
import '../../features/list_home_categorie/list_categorie/categorie_bloc.dart';
import '../../widget/custom_loader.dart';
import '../../widget/scalton/medium_card_scalton.dart';

class AccueilPagePage extends StatefulWidget {
  const AccueilPagePage({super.key});

  @override
  State<AccueilPagePage> createState() => _AccueilPagePageState();
}

class _AccueilPagePageState extends State<AccueilPagePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollController = ScrollController();
  bool _isUserScrolling = false;

  @override
  void initState() {
    BlocProvider.of<ListMenuFoodBloc>(context).add(FetchListMenuFoodEvent());
    BlocProvider.of<ListFoodsBloc>(context).add(FetchListFoodsEvent());
    BlocProvider.of<CategorieBloc>(context).add(FetchCategorieEvent());
    super.initState();
  }

  int _currentIndex = 0;
  final List<String> imageUrls = [
    'assets/images/banner.png',
    'assets/images/bnner3.png',
    'assets/images/banner2.png',
    'assets/images/banner2.jpg',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var categoryCTrl = context.read<CategorieController>();
    //var foodCTrl = context.read<RepasController>();
    //foodCTrl.recuperRepasApi();
    //categoryCTrl.recuperCategoriesApi();
    return Scaffold(
      //appBar: _appBarT(AppBar().preferredSize.height),
      appBar: Constantes.WidgetAppBar(
          title: "Accueil",),
      //backgroundColor: Colors_App.ColorGreyPage,
      body: _body(),
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
              top: 43.0.sp,
              left: PaddingDelimiter.paddingHorizontal,
              right: PaddingDelimiter.paddingHorizontal,
              child: AppBar(
                backgroundColor: Colors_App.Colorwhite,
                leading: IconButton(
                    onPressed: () {},
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
                          borderRadius: BorderRadius.circular(20.sp)),
                      hintStyle: TextStyle(color: Colors_App.ColorGrey)),
                ),
              ),
            )
          ],
        ),
      );

  _body() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        // Détecter si l'utilisateur fait défiler
        if (scrollInfo is UserScrollNotification) {
          if (scrollInfo.direction != ScrollDirection.idle) {
            setState(() {
              _isUserScrolling = true;
            });
          } else {
            setState(() {
              _isUserScrolling = false;
            });
          }
        }
        return false;
      },
      child: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        edgeOffset: 0.5,
        color: Colors_App.ColorYellow,
        key: _refreshIndicatorKey,
        onRefresh: () async {
          BlocProvider.of<ListMenuFoodBloc>(context)
              .add(FetchListMenuFoodEvent());
          BlocProvider.of<CategorieBloc>(context).add(FetchCategorieEvent());
          BlocProvider.of<ListFoodsBloc>(context).add(FetchListFoodsEvent());
          return Future.delayed(const Duration(seconds: 4));
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              CarouselSlider(
                items: imageUrls.map((url) {
                  return Container(
                    margin: EdgeInsets.all(3.sp),
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
                      if (!_isUserScrolling) {
                        // Éviter de reconstruire la page si l'utilisateur fait défiler
                        setState(() {
                          _currentIndex = index;
                        });
                      }
                    }),
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
              _menuDuJour(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Touts",
                          style: TextStyle(
                            color: Colors_App.Colorblack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(children: [
                            Text(
                              "Autres",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(
                              width: Adaptive.w(2),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 20.sp,
                            )
                          ]),
                        )
                      ],
                    ),
                    Text(
                        "Trouveez ici ce que notre cuisine propose aujourd'hui",
                        style: TextStyle(
                          color: Colors_App.ColorGrey,
                          fontSize: 15.sp,
                        ))
                  ],
                ),
              ),
              _foodList()
            ],
          ),
        ),
      ),
    );
  }

  _menuDuJour() {
    return BlocBuilder<ListMenuFoodBloc, ListMenuFoodState>(
      builder: (context, state) {
        if (state is ListMenuFoodSuccesState) {
          final List<Food> foods = state.foods;
          return foods.isEmpty
              ? const Center(
                  child: Text('Pas de foods'),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: PaddingDelimiter.paddingHorizontal,
                              bottom: PaddingDelimiter.paddingHorizontal,
                              right: PaddingDelimiter.paddingHorizontal),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Menu ",
                                      style: TextStyle(
                                        color: Colors_App.Colorblack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .push(Routes.listPlat);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors_App.ColorYellow,
                                          borderRadius:
                                              BorderRadius.circular(50.sp),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.sp, horizontal: 13.sp),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: PaddingDelimiter
                                                .paddingHorizontal),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Voir autres plats",
                                              style: TextStyle(
                                                  color: Colors_App.Colorwhite),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16.sp,
                                              color: Colors_App.Colorwhite,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Text(
                                  "Trouveez ici ce que notre cuisine propose aujourd'hui",
                                  style: TextStyle(
                                    color: Colors_App.ColorGrey,
                                    fontSize: 15.sp,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 33.h,
                            width: double.infinity,
                            child: ListView(
                              padding: EdgeInsets.only(
                                  left: PaddingDelimiter.paddingHorizontal),
                              scrollDirection: Axis.horizontal,
                              children: foods
                                  .asMap()
                                  .entries
                                  .map((e) => CardFoodMenu(
                                      name: "${e.value.name}",
                                      desc: "${e.value.description}",
                                      file_img:
                                          "${Constantes.BASE_URL}${e.value.fileImg}",
                                      price: e.value.price!,
                                      onTap: () {
                                        GoRouter.of(context).push(
                                            Routes.detailFoodpage,
                                            extra: e.value.toJson());
                                      }))
                                  .toList(),
                            )),
                      ],
                    ),
                  ),
                );
        } else if (state is ListMenuFoodErrorState) {
          List foods = DataApp.foods;
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: PaddingDelimiter.paddingHorizontal,
                        bottom: PaddingDelimiter.paddingHorizontal,
                        right: PaddingDelimiter.paddingHorizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Menu du jour ",
                                style: TextStyle(
                                  color: Colors_App.ColorYellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                )),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).push(Routes.listPlat);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors_App.ColorYellow,
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.sp, horizontal: 13.sp),
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          PaddingDelimiter.paddingHorizontal),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Voir autres plats",
                                        style: TextStyle(
                                            color: Colors_App.Colorwhite),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16.sp,
                                        color: Colors_App.Colorwhite,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Text(
                            "Trouvez ici ce que notre cuisine propose aujourd'hui",
                            style: TextStyle(
                              color: Colors_App.ColorYellow,
                              fontSize: 15.sp,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 33.h,
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.only(
                            left: PaddingDelimiter.paddingHorizontal),
                        scrollDirection: Axis.horizontal,
                        children: foods
                            .asMap()
                            .entries
                            .map((e) => CardFoodMenu(
                                name: "${e.value.name}",
                                desc: "${e.value.description}",
                                file_img:
                                    "${Constantes.BASE_URL}${e.value.fileImg}",
                                price: e.value.price!,
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(Routes.detailFoodpage);
                                  //GoRouter.of(context).go(Routes.detailFoodpage, extra: e.value.toJson());
                                }))
                            .toList(),
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  //specialCard(images[7]),

                  SizedBox(
                    height: 5.sp,
                  ),
                ],
              ),
            ),
          );
        } else {
          return buildFeaturedPartnersLoadingIndicator();
        }
      },
    );
  }

  int?
      _selectedCategoryId; // Stocke l'ID de la catégorie sélectionnée, null = toutes les catégories

  Widget category() {
    var categoryCtrl = context.watch<CategorieController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.h,
          width: double.infinity,
          child: BlocBuilder<CategorieBloc, CategorieState>(
            builder: (context, state) {
              if (state is CategorieSuccesState) {
                final List<Categorie> categories = state.categories;

                return categories.isEmpty
                    ? const Center(
                        child: Text('Pas de categories trouvées'),
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                            horizontal: PaddingDelimiter.paddingHorizontal),
                        children: [
                          // Bouton pour afficher tous les foods
                          Row(
                            children: [
                              ChoiceChip(
                                padding: EdgeInsets.all(8),
                                label: Row(
                                  children: [
                                    Icon(Icons.all_inclusive),
                                    // Icône pour toutes les catégories
                                    SizedBox(width: Adaptive.w(1)),
                                    Text('Touts'),
                                  ],
                                ),
                                selectedColor: Colors_App.ColorYellow,
                                // Couleur de sélection
                                selected: _selectedCategoryId == null,
                                // Si aucune catégorie n'est sélectionnée
                                onSelected: (bool selected) {
                                  setState(() {
                                    _selectedCategoryId =
                                        null; // Réinitialise la sélection
                                  });
                                },
                              ),
                              SizedBox(width: Adaptive.w(5)),
                            ],
                          ),
                          // Affichage des autres catégories
                          ...categories.asMap().entries.map((e) => Row(
                                children: [
                                  ChoiceChip(
                                    padding: EdgeInsets.all(8),
                                    label: Text(e.value.name),
                                    selectedColor: Colors_App.ColorGreen,
                                    selected: _selectedCategoryId == e.value.id,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _selectedCategoryId = selected
                                            ? e.value.id
                                            : null; // Sélectionne ou désélectionne la catégorie
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: Adaptive.w(5),
                                  ),
                                ],
                              )),
                        ],
                      );
              } else if (state is CategorieErrorState) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return LoadingIndicatorCategory();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _foodList() {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: BlocBuilder<ListFoodsBloc, ListFoodsState>(
        builder: (context, state) {
          if (state is ListFoodSuccesState) {
            final List<Food> foods = state.foods;

            // Filtrer les aliments en fonction de la catégorie sélectionnée
            final filteredFoods = _selectedCategoryId == null
                ? foods // Affiche tous les aliments si aucune catégorie n'est sélectionnée
                : foods
                    .where(
                        (food) => food.categoryFood?.id == _selectedCategoryId)
                    .toList();

            return filteredFoods.isEmpty
                ? Center(
                    child: Text("Pas de foods"),
                  )
                : Column(
                    children: filteredFoods
                        .asMap()
                        .entries
                        .map((e) => _cardFood(
                            onTap: () {
                              GoRouter.of(context).push(Routes.detailFoodpage,
                                  extra: e.value.toJson());
                            },
                            urlImage:
                                "${Constantes.BASE_URL}${e.value.fileImg}",
                            nameFood: e.value.name!,
                            category: e.value.categoryFood?.name,
                            price: e.value.price!))
                        .toList(),
                  );
          } else if (state is ListFoodErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return CircularProgressIndicator(
              color: Colors_App.ColorYellow,
            );
          }
        },
      ),
    );
  }

  Widget _cardFood({
    required String urlImage,
    required String nameFood,
    String? category,
    required Function onTap,
    required int price,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Adaptive.w(20),
              height: 10.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50.sp)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.sp),
                child: Image.network(
                  urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: Adaptive.w(10),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameFood,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors_App.Colorblack,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category ?? "",
                      style: TextStyle(color: Colors_App.ColorGreySection),
                    ),
                  ],
                ),
                Text(
                  "\$${price}",
                  style: TextStyle(
                      color: Colors_App.ColorYellow,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildFeaturedPartnersLoadingIndicator() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          2,
          (index) => const Padding(
            padding: EdgeInsets.only(left: 16),
            child: MediumCardScalton(),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView LoadingIndicatorCategory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          2,
          (index) => const Padding(
            padding: EdgeInsets.only(left: 16),
            child: CustomLoader(),
          ),
        ),
      ),
    );
  }
}
