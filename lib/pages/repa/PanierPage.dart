import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/Routes.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  int itemCount = 1;
  int platCount = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constantes.WidgetAppBar(
          title: "Cart",
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete,))
        ]
      ),
      body: ListView.builder(
        itemCount: platCount,
          itemBuilder: (context, index){
            return _food();
          }
      ),
      persistentFooterButtons: _footerPanier(),
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors_App.ColorGreen,
      title: Text("Cart", style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
          color: Colors_App.Colorwhite),),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors_App.Colorwhite,))
      ],
    );
  }

  _food() {
    return Padding(
      padding: EdgeInsets.all(20.sp),
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
              child: Image.asset(
                "assets/images/t3.png",
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
                "Nom du food",
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
                    "Category",
                    style: TextStyle(color: Colors_App.ColorGreySection),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          setState(() {
                            if (itemCount > 1) itemCount--;
                          });
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors_App.ColorGreyPage,
                          size: 22.sp,
                        ),
                      ),
                      Text("${itemCount}"),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          setState(() {
                            itemCount++;
                          });
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors_App.ColorYellow,
                          size: 22.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "\$50.00",
                style: TextStyle(
                    color: Colors_App.ColorYellow, fontWeight: FontWeight.bold),
              ),
            ],
          ),

        ],
      ),
    );
  }

  _element() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: platCount,
        padding: EdgeInsets.only(top: 15.sp),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              //GoRouter.of(context).push(Routes.detailFoodpage);
            },
            onLongPress: () async {
              ouvrirDialog(
                context,
                content: "Voulez-vous supprimer ce plat ?",
                title: "Suppression d'un plat",
              );
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
            title: Text(
              "Chawrama",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors_App.Colorblack),
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("\$ 25.00", //prices[index],
                        style: TextStyle(
                          color: Colors_App.Colorblack,
                          fontSize: 16.sp,
                        )),
                  ],
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder()),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors_App.ColorGrey),
                        iconSize: MaterialStatePropertyAll(20.sp),
                        minimumSize:
                            MaterialStatePropertyAll(Size.fromRadius(16.sp))),
                    onPressed: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      size: 17.sp,
                    )),
                Text("0"),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder()),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors_App.ColorYellow),
                        iconSize: MaterialStatePropertyAll(20.sp),
                        minimumSize:
                            MaterialStatePropertyAll(Size.fromRadius(16.sp))),
                    onPressed: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 17.sp,
                    ))
              ],
            ),
          );
        });
  }

  _footerPanier() {
    return <Widget>[
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingDelimiter.paddingHorizontal),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$140.00",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: Adaptive.w(double.infinity),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all( Radius.circular(20),),
                  ),
              
                  backgroundColor: Colors_App.ColorYellow, // Couleur de fond
                ),
                child: Text('Commander', style: TextStyle(color: Colors_App.Colorwhite),),
              ),
            ),

          ],
        ),
      )
    ];
  }

  ouvrirDialog(context,
      {required String title, required String content}) async {
    bool? resulat = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        //var auth = context.watch<AuthentificationCtrl>();
        return AlertDialog(
          title: Text(title),
          content: new Text(content),
          actions: <Widget>[
            TextButton(
              child: new Text(
                "Annuler",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            new TextButton(
              child: new Text(
                "Confirmer",
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );

    if (resulat != null) {
      var message =
          !resulat ? "Bientôt disponible" : "Suppression bientôt disponible";
      showSnackBar(context, message);
    }
  }

  showSnackBar(context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'OK',
          textColor: Colors.orange,
          onPressed: scaffold.hideCurrentSnackBar),
    ));
  }
}
