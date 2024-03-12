import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../models/UserModel.dart';
import '../utils/StockageKeys.dart';

class UserController with ChangeNotifier {
  UserModel? user;
  bool loading = false;
  GetStorage stockage = GetStorage();
  bool _isFirstTimeBienvenue=false;
  bool get isFirstTimeBienvenue {
    return stockage?.read<bool>(StockageKeys.is_first_time) ?? _isFirstTimeBienvenue;
  }

  set isFirstTimeBienvenue(bool value) {
    _isFirstTimeBienvenue = value;
    stockage?.write(StockageKeys.is_first_time, value);
  }

  UserController({required this.stockage});
}