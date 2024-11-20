import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'check_connexion_event.dart';
part 'check_connexion_state.dart';

class CheckConnexionBloc extends Bloc<CheckConnexionEvent, CheckConnexionState> {
  final Connectivity _connectivity = Connectivity();

  CheckConnexionBloc() : super(CheckConnexionInitial()) {
    on<CheckConnexionEvent>((event, emit) async {
      var result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        emit(InternetDisconnected(message: 'Vous êtes connecté.e'));
      } else {
        emit(InternetConnected(message: 'Aucune connexion Internet'));
      }
    });
  }
}
