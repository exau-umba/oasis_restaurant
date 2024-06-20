import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oasis_restaurant/data/models/Categorie.dart';

import '../../../data/services/categorie_service.dart';

part 'categorie_event.dart';
part 'categorie_state.dart';

class CategorieBloc extends Bloc<CategorieEvent, CategorieState> {
  final CategorieService categorieService = CategorieService();
  late StreamSubscription streamSubscription;
  CategorieBloc() : super(CategorieInitial()) {
    on<CategorieEvent>((event, emit) async {
      // TODO: implement event handler

      if(event is FetchCategorieEvent) {

        emit(LoadingCategorieState());

        try {
          List<Categorie> categories = await categorieService.getCategories();
          emit(CategorieSuccesState(categories: categories));
        } catch (e) {
          emit(const CategorieErrorState(message: 'Une erreur est survenue'));
        }
      }
    });
  }
}
