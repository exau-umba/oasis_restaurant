part of 'favorie_bloc.dart';

sealed class FavorieEvent extends Equatable {
  const FavorieEvent();
}

class AddToFavorite extends FavorieEvent {
  final Food food; // Food est l'objet représentant un plat
  AddToFavorite(this.food);

  @override
  List<Object?> get props => [food];
}

class RemoveFromFavorite extends FavorieEvent {
  final Food food;
  RemoveFromFavorite(this.food);

  @override
  // TODO: implement props
  List<Object?> get props => [food];
}
