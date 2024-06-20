part of 'list_foods_bloc.dart';

sealed class ListFoodsState extends Equatable {
  const ListFoodsState();
  @override
  List<Object> get props => [];
}

final class ListFoodsInitial extends ListFoodsState {
  @override
  List<Object> get props => [];
}

class LoadingListFoodState extends ListFoodsState {}

class ListFoodSuccesState extends ListFoodsState {
  final List<Food> foods;

  const ListFoodSuccesState({required this.foods});

  @override
  List<Object> get props => [foods];
}

class ListFoodErrorState extends ListFoodsState {
  final String message;

  const ListFoodErrorState({ required this.message});

  @override
  List<Object> get props => [message];
}

class SearchFoodState extends ListFoodsState {
  final String key_word;

  const SearchFoodState({ required this.key_word});

  @override
  List<Object> get props => [key_word];
}

