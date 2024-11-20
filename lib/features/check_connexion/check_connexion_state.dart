part of 'check_connexion_bloc.dart';

sealed class CheckConnexionState extends Equatable {
  const CheckConnexionState();
}

final class CheckConnexionInitial extends CheckConnexionState {
  @override
  List<Object> get props => [];
}

class InternetConnected extends CheckConnexionState {
  final String message;
  const InternetConnected({required this.message});

  @override
  List<Object> get props => [message];
}

class InternetDisconnected extends CheckConnexionState {
  final String message;
  const InternetDisconnected({required this.message});

  @override
  List<Object?> get props => [message];
}