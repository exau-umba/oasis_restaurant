import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/Food.dart';

part 'favorie_event.dart';
part 'favorie_state.dart';

class FavorieBloc extends Bloc<FavorieEvent, FavorieState> {
  List<Food> _favories = [];

  FavorieBloc() : super(FavorieInitial()) {
    on<FavorieEvent>((event, emit) {
      if(event is AddToFavorite){
        if (!_favories.contains(event.food)) {
          _favories.add(event.food);
          emit(FavorieUpdated(List.from(_favories)));
        }

        if (event is RemoveFromFavorite){
          if (_favories.contains(event.food)) {
            _favories.remove(event.food);
            emit(FavorieUpdated(List.from(_favories)));
          }
        }
      }
    });
  }
}
