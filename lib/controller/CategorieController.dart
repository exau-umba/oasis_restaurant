import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/models/CategorieModel.dart';

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
    loading = true;
    notifyListeners();
    var reponse = await getData(url);

    if(reponse!=null && reponse != []){
      categories=reponse["data"].map<CategorieModel>((e) => CategorieModel.fromJson(e)).toList();
      isHttpException = false;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
  }

}