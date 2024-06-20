import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/Food.dart';
import '../../../data/services/food_service.dart';

part 'single_food_event.dart';
part 'single_food_state.dart';

class SingleFoodBloc extends Bloc<SingleFoodEvent, SingleFoodState> {
  final FoodService foodService = FoodService();
  late StreamSubscription streamSubscription;
  SingleFoodBloc() : super(SingleFoodInitial()) {
    on<SingleFoodEvent>((event, emit) async {
      // TODO: implement event handler

      if(event is FetchSingleFoodEvent) {

        emit(LoadingSingleFoodState());

        try {
          Food? food = await foodService.getSingleFoods(FetchSingleFoodEvent);
          emit(SingleFoodSuccesState(food: food!));
        } catch (e) {
          emit(const SingleFoodErrorState(message: 'Une erreur est survenue'));
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
