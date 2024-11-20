part of 'list_order_bloc.dart';

sealed class ListOrderState extends Equatable {
  const ListOrderState();

  @override
  List<Object> get props => [];
}

final class ListOrderInitial extends ListOrderState {
  @override
  List<Object> get props => [];
}

class LoadingListOrderState extends ListOrderState {}

class ListOrderSuccesState extends ListOrderState {
  final List<Order> orders;

  const ListOrderSuccesState({required this.orders});

  @override
  List<Object> get props => [orders];
}

class ListOrderErrorState extends ListOrderState {
  final String message;

  const ListOrderErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class AddFoodSuccesState extends ListOrderState {
  final Food food;

  const AddFoodSuccesState({required this.food});

  @override
  List<Object> get props => [food];
}

class AddFoodErrorState extends ListOrderState {
  final String message;

  const AddFoodErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

