part of 'categorie_bloc.dart';

sealed class CategorieEvent extends Equatable {
  const CategorieEvent();
  @override
  List<Object> get props => [];
}

class FetchCategorieEvent extends CategorieEvent {}

