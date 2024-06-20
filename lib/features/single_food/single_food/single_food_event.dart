part of 'single_food_bloc.dart';

sealed class SingleFoodEvent extends Equatable {
  const SingleFoodEvent();

  @override
  List<Object> get props => [];
}

class FetchSingleFoodEvent extends SingleFoodEvent {
  final Food food;
  const FetchSingleFoodEvent({required this.food});

  @override
  List<Object> get props => [food];
}

class AddFoodCartState extends SingleFoodState {
  final Food food;

  const AddFoodCartState({ required this.food});

  @override
  List<Object> get props => [food];
}

class IncrementQteFoodCartState extends SingleFoodState {
  final int counterValue;

  const IncrementQteFoodCartState({ required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

