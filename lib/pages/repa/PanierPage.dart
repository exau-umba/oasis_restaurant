import 'package:flutter/material.dart';
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
  int itemCount = 0;
  int platCount = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors_App.Colorwhite,
        elevation: 0.sp,
        title: Text(
          "Panier",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors_App.Colorblack
          ),
        ),
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
                    showSnackBar(context, "Bientôt disponible");
                  },
                ),
                InkWell(
                  child: Icon(
                    Icons.delete,
                    color: Colors_App.Colorwhite,
                  ),
                  onTap: (){
                    ouvrirDialog(context, content: "Voulez-vous vraiment supprimer tout les plats  ?", title: "Suppression");
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: _element(),
      persistentFooterButtons: _footerPanier(),
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }

  _element(){
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: platCount,
        padding: EdgeInsets.only(top: 15.sp),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              //GoRouter.of(context).push(Routes.detailFoodpage);
            },
            onLongPress: () async{
              ouvrirDialog(context,content: "Voulez-vous supprimer ce plat ?", title: "Suppression d'un plat",);
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
                color: Colors_App.Colorblack
              ),
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("\$ 25.00",//prices[index],
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
                        backgroundColor: MaterialStatePropertyAll(Colors_App.ColorGrey),
                        iconSize: MaterialStatePropertyAll(20.sp),
                        minimumSize: MaterialStatePropertyAll(Size.fromRadius(16.sp))
                    ),
                    onPressed: (){
                      setState(() {
                        itemCount++;
                      });
                    },
                    child: Icon(
                        Icons.remove,
                      size: 17.sp,
                    )
                ),
                Text("0"),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(CircleBorder()),
                    backgroundColor: MaterialStatePropertyAll(Colors_App.ColorYellow),
                    iconSize: MaterialStatePropertyAll(20.sp),
                    minimumSize: MaterialStatePropertyAll(Size.fromRadius(16.sp))
                  ),
                    onPressed: (){
                    setState(() {
                      itemCount++;
                    });
                    },
                    child: Icon(
                        Icons.add,
                      size: 17.sp,
                    )
                )
              ],
            ),
          );
        }
    );
  }

  _footerPanier(){
    return <Widget> [
      Container(
        padding: EdgeInsets.symmetric(horizontal: PaddingDelimiter.paddingHorizontal),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Livraison :",
                  style: TextStyle(
                    fontSize: 18.sp
                  ),
                ),
                Text(
                  "\$0.0",
                  style: TextStyle(
                      fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL :",
                  style: TextStyle(
                      fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "\$140",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            FractionallySizedBox(
              widthFactor: 4.3.sp,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors_App.ColorGreen,
                  textStyle: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.sp)
                ),
                  onPressed: (){
                    showSnackBar(context, "La commande sera bientôt disponible");
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Commander"),
                      Icon(
                          Icons.arrow_forward_ios,
                        size: 16.sp,
                      ),
                    ],
                  )
              ),
            ),
            SizedBox(height: 2.h,),
            Text(
                "Selectionnez le moyen de livraison et le mode de paiement à l'étape suivante.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h,),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/card_payement.jpg",
                  width: Adaptive.w(75),
                )
              ],
            )
          ],
        ),
      )
    ];
  }
  ouvrirDialog(context, {required String title, required String content}) async {
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
                "Confirmer", style: TextStyle(color: Colors.orange),),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );

    if (resulat != null) {
      var message = !resulat ? "Bientôt disponible" : "Suppression bientôt disponible";
      showSnackBar(context, message);
    }
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
