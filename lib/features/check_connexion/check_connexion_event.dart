part of 'check_connexion_bloc.dart';

sealed class CheckConnexionEvent extends Equatable {
  const CheckConnexionEvent();
}

class CheckInternetConnection extends CheckConnexionEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}