part of 'categorie_bloc.dart';

sealed class CategorieState extends Equatable {
  const CategorieState();

  @override
  List<Object> get props => [];
}

final class CategorieInitial extends CategorieState {

  @override
  List<Object> get props => [];
}

class LoadingCategorieState extends CategorieState {}

class CategorieSuccesState extends CategorieState {
  final List<Categorie> categories;

  const CategorieSuccesState({required this.categories});

  @override
  List<Object> get props => [categories];
}

class CategorieErrorState extends CategorieState {
  final String message;

  const CategorieErrorState({ required this.message});

  @override
  List<Object> get props => [message];
}

