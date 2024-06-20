part of 'list_menu_food_bloc.dart';

sealed class ListMenuFoodEvent extends Equatable {
  const ListMenuFoodEvent();

  @override
  List<Object> get props => [];
}

class FetchListMenuFoodEvent extends ListMenuFoodEvent {}
