import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/Food.dart';
import '../../../data/services/food_service.dart';

part 'list_foods_event.dart';
part 'list_foods_state.dart';

class ListFoodsBloc extends Bloc<ListFoodsEvent, ListFoodsState> {
  final FoodService foodService = FoodService();
  late StreamSubscription streamSubscription;
  ListFoodsBloc() : super(ListFoodsInitial()) {
    on<ListFoodsEvent>((event, emit) async {
      // TODO: implement event handler

      if(event is FetchListFoodsEvent) {

        emit(LoadingListFoodState());

        try {
          List<Food> foods = await foodService.getFoods();
          emit(ListFoodSuccesState(foods: foods));
        } catch (e) {
          emit(const ListFoodErrorState(message: 'Une erreur est survenue'));
        }
      }

      if(event is SearchListFoodEvent) {

        emit(LoadingListFoodState());

        try {
          List<Food> foods = await foodService.getFoods();
          emit(ListFoodSuccesState(foods: foods));
        } catch (e) {
          emit(const ListFoodErrorState(message: 'Une erreur est survenue'));
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
