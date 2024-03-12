import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/models/RepasModel.dart';

import '../utils/Endpoints.dart';
import '../utils/Requests.dart';

class RepasController with ChangeNotifier{
  GetStorage? stockage;
  List<RepasModel> repas = [];
  RepasModel? repa;
  bool loading = false;
  bool? isHttpException;

  RepasController({this.stockage});

  void recuperRepasApi() async {
    var url = "${Endpoints.getRepas}";
    loading = true;
    notifyListeners();
    var reponse = await getData(url);

    if(reponse!=null && reponse != []){
      repas=reponse["data"].map<RepasModel>((e) => RepasModel.fromJson(e)).toList();
      isHttpException = false;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
  }


  void recuperOneRepaApi(repaId) async {
    var urlWithRepaId = Endpoints.getSingleRepa.replaceAll("{id}", repaId.toString());
    var url = "${urlWithRepaId}";
    loading = true;
    notifyListeners();
    var reponse = await getData(url);

    if(reponse!=null){
      repa=RepasModel.fromJson(reponse);
      isHttpException = false;
    }else{
      isHttpException = true;
      var for_a_time_data = RepasModel.fromJson(reponse ?? {});
      repa = for_a_time_data;
    }
    loading = false;
    notifyListeners();
  }
}