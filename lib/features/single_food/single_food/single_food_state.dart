part of 'single_food_bloc.dart';

sealed class SingleFoodState extends Equatable {
  const SingleFoodState();

  @override
  List<Object> get props => [];
}

final class SingleFoodInitial extends SingleFoodState {
  @override
  List<Object> get props => [];
}

class LoadingSingleFoodState extends SingleFoodState {}

class SingleFoodSuccesState extends SingleFoodState {
  final Food food;

  const SingleFoodSuccesState({required this.food});
  @override
  List<Object> get props => [food];
}

class SingleFoodErrorState extends SingleFoodState {
  final String message;

  const SingleFoodErrorState({ required this.message});
  @override
  List<Object> get props => [message];
}



