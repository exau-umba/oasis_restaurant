part of 'list_foods_bloc.dart';

sealed class ListFoodsEvent extends Equatable {
  const ListFoodsEvent();

  @override
  List<Object> get props => [];
}

class FetchListFoodsEvent extends ListFoodsEvent {}

class SearchListFoodEvent extends ListFoodsEvent {
  final String key_word;
  const SearchListFoodEvent({required this.key_word});

  @override
  List<Object> get props => [key_word];
}

