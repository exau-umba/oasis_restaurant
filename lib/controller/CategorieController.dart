import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/models/CategorieModel.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';
import 'package:oasis_restaurant/utils/StockageKeys.dart';

import '../utils/Endpoints.dart';
import '../utils/Requests.dart';

class CategorieController with ChangeNotifier{

  GetStorage? stockage;
  List<CategorieModel> categories = [];
  bool loading = false;
  bool? isHttpException;

  CategorieController({this.stockage});

  void recuperCategoriesApi() async {
    var url = "${Endpoints.getcategory}";
    var token = StockageKeys.token;
    loading = true;
    //notifyListeners();
    var reponse = await getData(url, token: Constantes.token);

    if(reponse!=null && reponse != []){
      categories=reponse["data"].map<CategorieModel>((e) => CategorieModel.fromJson(e)).toList();
      print("CATEGORIES : ${reponse['data']}");
      isHttpException = false;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
  }

}