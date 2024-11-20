import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oasis_restaurant/data/models/Food.dart';
import 'package:oasis_restaurant/data/models/Order.dart';
import 'package:oasis_restaurant/data/services/food_service.dart';
import 'package:oasis_restaurant/features/list_order/services/orderService.dart';

part 'list_order_event.dart';
part 'list_order_state.dart';

class ListOrderBloc extends Bloc<ListOrderEvent, ListOrderState> {
  final OrderService orderService = OrderService();
  final FoodService foodService = FoodService();
  late StreamSubscription streamSubscription;
  ListOrderBloc() : super(ListOrderInitial()) {
    on<ListOrderEvent>((event, emit) async {
      // TODO: implement event handler

      if(event is FetchListOrderEvent) {
        emit(LoadingListOrderState());
        try {
          List<Order> orders = await orderService.getOrderApi();
          emit(ListOrderSuccesState(orders: orders));
        } catch (e) {
          emit(const ListOrderErrorState(message: 'Une erreur est survenue'));
        }
      }

      if (event is AddFoodEvent){
        try{
          Food? food = await foodService.getSingleFoods(event.food.id);
          emit(AddFoodSuccesState(food: food!));
        } catch(e){
          emit(const AddFoodErrorState(message: "Une erruer est survenue"));
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
