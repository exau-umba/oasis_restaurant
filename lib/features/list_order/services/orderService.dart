import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_restaurant/data/models/Order.dart';
import 'package:oasis_restaurant/features/list_order/services/endpoints.dart';

import '../../../utils/Constantes/Constantes.dart';
import '../../../utils/Requests.dart';
import '../../../utils/StockageKeys.dart';

class OrderService with ChangeNotifier{

  GetStorage? stockage;
  List<Order> orders = [];
  Order? order;
  bool loading = false;
  bool? isHttpException;

  OrderService({this.stockage});

  Future<List<Order>> getOrderApi() async {
    var url = "${OrderEndpoints.getOrder}";
    var token = stockage?.read(StockageKeys.token);
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: Constantes.token);

    if(reponse!=null && reponse != []){
      orders=reponse["data"].map<Order>((e) => Order.fromJson(e)).toList();
      isHttpException = false;

      return orders;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
    return orders;
  }

}