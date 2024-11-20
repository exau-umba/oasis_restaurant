import 'package:flutter/material.dart';

class DataApp{

  static const List foods = [
    {
      "id": 1,
      "name": "Salades",
      "price": 5,
      "amount": 10,
      "description": "description",
      "file_img": "assets/images/t1.png",
      "is_active": 1,
      "category_food": ""
    },
    {
      "id": 2,
      "name": "Pizza",
      "price": 20,
      "amount": 5,
      "description": "description",
      "file_img": "assets/images/t3.png",
      "is_active": 1,
      "category_food": ""
    },
    {
      "id": 3,
      "name": "Oeuf cru au salades",
      "price": 10,
      "amount": 15,
      "description": "description",
      "file_img": "assets/images/t2.png",
      "is_active": 1,
      "category_food": ""
    }
  ];

  static const List category = [
    {
      "id": 1,
      "name": "Fast food",
      "is_active": 1
    },
    {
      "id": 2,
      "name": "Food cru",
      "is_active": 1
    },
    {
      "id": 3,
      "name": "Food delive",
      "is_active": 1
    }
  ];
}