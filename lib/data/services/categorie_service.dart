import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/data/models/Categorie.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/StockageKeys.dart';

import '../../utils/Endpoints.dart';
import '../../utils/Requests.dart';

class CategorieService with ChangeNotifier{

  GetStorage? stockage;
  List<Categorie> categories = [];
  bool loading = false;
  bool? isHttpException;

  CategorieService({this.stockage});

  Future<List<Categorie>> getCategories() async {
    var url = "${Endpoints.getcategorie}";
    var token = stockage?.read(StockageKeys.token);
    loading = true;
    //notifyListeners();
    var reponse = await getData(url, token: Constantes.token);

    if(reponse!=null && reponse != []){
      categories=reponse["data"].map<Categorie>((e) => Categorie.fromJson(e)).toList();
      print("CATEGORIES : ${reponse['data']}");
      isHttpException = false;
      return categories;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
    return categories;

  }

}