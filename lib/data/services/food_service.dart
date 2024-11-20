import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/data/models/Food.dart';
import 'package:oasis_restaurant/models/RepasModel.dart';
import 'package:oasis_restaurant/utils/Constantes/Constantes.dart';

import '../../utils/Endpoints.dart';
import '../../utils/Requests.dart';
import '../../utils/StockageKeys.dart';

class FoodService with ChangeNotifier{
  GetStorage? stockage;
  List<Food> foods = [];
  Food? food;
  bool loading = false;
  bool? isHttpException;

  FoodService({this.stockage});

  Future<List<Food>> getFoods() async {
    var url = "${Endpoints.food}";
    var token = stockage?.read(StockageKeys.token);
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: Constantes.token);

    if(reponse!=null && reponse != []){
      foods=reponse["data"].map<Food>((e) => Food.fromJson(e)).toList();
      print("FOODS : ${reponse['data']}");
      isHttpException = false;
      return foods;
    }else{
      isHttpException = true;
      print("FOODS ERROR : ${reponse['data']}");

    }
    loading = false;
    notifyListeners();
    return foods;
  }


  Future<Food?> getSingleFoods(foodId) async {
    var urlWithFoodId = Endpoints.getSingleFood.replaceAll("{id}", foodId.toString());
    var url = "${urlWithFoodId}";
    loading = true;
    notifyListeners();
    var reponse = await getData(url);

    if(reponse!=null){
      food = Food.fromJson(reponse);
      isHttpException = false;
      print("+++++++++++++++++++++++++++$food");
      return food;
    }else{
      isHttpException = true;
      var for_a_time_data = Food.fromJson(reponse ?? {});
      food = for_a_time_data;
    }
    loading = false;
    notifyListeners();
    return food;
  }
}