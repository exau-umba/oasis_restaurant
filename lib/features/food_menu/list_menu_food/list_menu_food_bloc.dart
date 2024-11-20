import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oasis_restaurant/data/services/food_service.dart';

import '../../../data/models/Food.dart';
import '../../list_foods/list_foods/list_foods_bloc.dart';

part 'list_menu_food_event.dart';
part 'list_menu_food_state.dart';

class ListMenuFoodBloc extends Bloc<ListMenuFoodEvent, ListMenuFoodState> {
  final FoodService foodService = FoodService();
  late StreamSubscription streamSubscription;
  ListMenuFoodBloc() : super(ListMenuFoodInitial()) {
    on<ListMenuFoodEvent>((event, emit) async {
      // TODO: implement event handler

      if(event is FetchListMenuFoodEvent) {

        emit(LoadingListMenuFoodState());

        try {
          List<Food> foods = await foodService.getFoods();
          List<Food> foodsActived = foods.where((element) => element.isActive == 1).toList();
          emit(ListMenuFoodSuccesState(foods: foodsActived));
        } catch (e) {
          emit(const ListMenuFoodErrorState(message: 'Une erreur est survenue'));
        }
      }
    });
  }



  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
