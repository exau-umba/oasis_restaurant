part of 'list_order_bloc.dart';

sealed class ListOrderEvent extends Equatable {
  const ListOrderEvent();

  @override
  List<Object> get props => [];
}

class FetchListOrderEvent extends ListOrderEvent {}

class AddFoodEvent extends ListOrderEvent {
  final Food food;
  const AddFoodEvent({required this.food});

  @override
  List<Object> get props => [food];
}

class RemoveOrderEvent extends ListOrderEvent {
  final Order order;
  const RemoveOrderEvent({required this.order});

  @override
  List<Object> get props => [order];
}

class UpdateQteFoodEvent extends ListOrderEvent {
  final int idFood;
  const UpdateQteFoodEvent({required this.idFood});

  @override
  List<Object> get props => [idFood];
}
