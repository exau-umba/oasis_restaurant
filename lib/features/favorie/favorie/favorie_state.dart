part of 'favorie_bloc.dart';

sealed class FavorieState extends Equatable {
  const FavorieState();
}

class FavorieInitial extends FavorieState {
  @override
  List<Object> get props => [];
}

class FavorieUpdated extends FavorieState {
  final List<Food> favorites;

  const FavorieUpdated(this.favorites);

  @override
  List<Object?> get props => [favorites];
}
