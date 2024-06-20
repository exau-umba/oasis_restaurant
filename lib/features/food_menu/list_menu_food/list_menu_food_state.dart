part of 'list_menu_food_bloc.dart';

sealed class ListMenuFoodState extends Equatable {
  const ListMenuFoodState();

  @override
  List<Object> get props => [];
}

final class ListMenuFoodInitial extends ListMenuFoodState {
  @override
  List<Object> get props => [];
}

class LoadingListMenuFoodState extends ListMenuFoodState {}

class ListMenuFoodSuccesState extends ListMenuFoodState {
  final List<Food> foods;

  const ListMenuFoodSuccesState({required this.foods});

  @override
  List<Object> get props => [foods];
}

class ListMenuFoodErrorState extends ListMenuFoodState {
  final String message;

  const ListMenuFoodErrorState({ required this.message});

  @override
  List<Object> get props => [message];
}

